package com.hujiayi.auxiliaryteach.ums.controller;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.hujiayi.auxiliaryteach.ums.service.MemberService;
import com.hujiayi.auxiliaryteach.ums.utils.HttpClientUtils;
import com.hujiayi.auxiliaryteach.ums.prop.WxLoginProperties;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Slf4j
@RequestMapping("/api/ucenter")
@Controller
public class WxLoginController {

    @Autowired
    private WxLoginProperties ucenterProperties;

    @Autowired
    private MemberService memberService;

    @GetMapping("/wx/login")
    public String wxLogin(HttpSession session) {

        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";
        //处理回调url
        String redirecturi = "";

        try {
            redirecturi = URLEncoder.encode(ucenterProperties.getRedirectUri(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.error(ExceptionUtils.getMessage(e));
            throw new XliException(20001, "获取重定向路径异常o(╥﹏╥)o");
        }

        //处理state：生成随机数，存入session
        String state = UUID.randomUUID().toString();
        log.info("生成 state = " + state);
        session.setAttribute("wx_open_state", state);

        String qrcodeUrl = String.format(
                baseUrl,
                ucenterProperties.getAppId(),
                redirecturi,
                state
        );

        return "redirect:" + qrcodeUrl;
    }

    /**
     * code，state为用户确认登录后, 微信开发平台返回的回调参数, code为临时凭证票据, state为状态
     */
    @GetMapping("/wx/callback")
    public String callback(String code, String state, HttpSession session) {
        // 1. 回调被拉起，并获得code和state参数
        log.info("callback被调用");
        log.info("code = " + code);
        log.info("state = " + state);

        // 2. 验证信息
        if(StringUtils.isEmpty(code) || StringUtils.isEmpty(state)) {
            log.error("非法回调请求");
            throw new XliException(20001, "非法回调, 请求异常o(╥﹏╥)o");
        }

        // 3. 判断session的state与回调的state是否一致
        String sessionState = (String) session.getAttribute("wx_open_state");
        if(!sessionState.equals(state)) {
            throw new XliException(20001, "非法回调, 请求异常o(╥﹏╥)o");
        }

        // 4. 发送请求. 携带授权临时票据code, 和 appid以及appsecret，请求微信OAuth2授权服务器, 返回Access_token
        String accessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token";
        Map<String, String> accessTokenParam = new HashMap(16);
        accessTokenParam.put("appid", ucenterProperties.getAppId());
        accessTokenParam.put("secret", ucenterProperties.getAppSecret());
        accessTokenParam.put("code", code);
        accessTokenParam.put("grant_type", "authorization_code");
        HttpClientUtils client = new HttpClientUtils(accessTokenUrl, accessTokenParam);

        String result = "";
        try {
            // 发送请求
            client.get();
            // 获取内容.
            result = client.getContent();
            System.out.println("result = " + result);
        } catch (Exception e) {
            log.error("获取access_token失败");
            throw new XliException(20001, "获取access_token异常o(╥﹏╥)o");
        }

        // 5. 将result装换为map的形式, 获取access_token
        Gson gson = new Gson();
        HashMap<String, Object> resultMap = gson.fromJson(result, HashMap.class);

        // 6. 判断微信获取access_token失败的响应
        Object errcodeObj = resultMap.get("errcode");
        if(errcodeObj != null){
            String errmsg = (String)resultMap.get("errmsg");
            Double errcode = (Double)errcodeObj;
            log.error("获取access_token失败 - " + "message: " + errmsg + ", errcode: " + errcode);
            throw new XliException(20001, "获取access_token异常o(╥﹏╥)o");
        }

        // 7. 微信获取access_token响应成功
        String accessToken = (String)resultMap.get("access_token");
        String openid = (String)resultMap.get("openid");

        // 打印
        log.info("accessToken = " + accessToken);
        log.info("openid = " + openid);

        // 先查询当前用户是否已经使用微信注册或者登陆过,
        // 如果注册或者登陆过, 根据对象生成token, 重定向到前台
        // 如果注册或者登陆过, 根据access_token获取微信用户的基本信息, 然后根据对象生成token, 重定向到前台
        Member member = memberService.getMemberByOpenId(openid);

        // 8. 判断member
        if(member == null) {
            // 8.1 通过openid和access_token访问微信开发平台接口, 获取用户信息
            String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo";
            Map<String, String> baseUserInfoParam = new HashMap(16);
            baseUserInfoParam.put("access_token", accessToken);
            baseUserInfoParam.put("openid", openid);
            client = new HttpClientUtils(baseUserInfoUrl, baseUserInfoParam);

            // 8.2 发送请求
            String resultUserInfo = null;
            try {
                client.get();
                resultUserInfo = client.getContent();
            } catch (Exception e) {
                log.error(ExceptionUtils.getMessage(e));
                throw new XliException(20001, "获取用户信息异常o(╥﹏╥)o");
            }
            // 8.3 将json形式的字符串, 通过 gson 转换为指定的map形式
            HashMap<String, Object> resultUserInfoMap = gson.fromJson(resultUserInfo, HashMap.class);
            Object userInfoErrcodeObj = resultMap.get("errcode");
            if(userInfoErrcodeObj != null){
                log.error("获取用户信息失败" + "，message：" + resultMap.get("errmsg"));
                throw new XliException(20001, "获取用户信息异常o(╥﹏╥)o");
            }
            // 8.4 获取用户信息
            String nickname = (String)resultUserInfoMap.get("nickname");
            String headimgurl = (String)resultUserInfoMap.get("headimgurl");
            Double sex = (Double)resultUserInfoMap.get("sex");

            // 8.5 用户注册
            member = new Member();
            member.setOpenid(openid);
            member.setNickname(nickname);
            member.setAvatar(headimgurl);
            member.setSex(sex.intValue());
            memberService.save(member);

        }

        // 9. 封装属性, 获取token
        JwtInfo jwtInfo = new JwtInfo();
        jwtInfo.setId(member.getId());
        jwtInfo.setNickname(member.getNickname());
        jwtInfo.setAvatar(member.getAvatar());
        String jwtToken = JwtUtils.getJwtToken(jwtInfo, 1800);

        // 10. 携带token跳转
        return "redirect:http://localhost:3000?token=" + jwtToken;
    }

}
