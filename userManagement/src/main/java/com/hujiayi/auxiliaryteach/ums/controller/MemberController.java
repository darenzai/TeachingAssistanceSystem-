package com.hujiayi.auxiliaryteach.ums.controller;




import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.common.utils.MD5Utils;
import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.hujiayi.auxiliaryteach.ums.service.MemberService;
import com.hujiayi.auxiliaryteach.ums.vo.LoginVo;
import com.hujiayi.auxiliaryteach.ums.vo.RegisterVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@Slf4j
@RestController
@RequestMapping("/ums/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private RedisTemplate redisTemplate;

    // 通过手机验证码注册用户
    @PostMapping("/register")
    public R registerMemberByMobile(@RequestBody RegisterVo registerVo) {
        memberService.registerMemberByMobile(registerVo);
        return R.ok();
    }

    // 登录方法
    @PostMapping("/login")
    public R loginMember(@RequestBody LoginVo loginVo) {
        String token = memberService.loginMember(loginVo);
        return R.ok().put("token", token);
    }

    // 根据request中的token获取用户信息
    @GetMapping("/get/login/info")
    public R getLoginInfo(HttpServletRequest request) {
        JwtInfo info = JwtUtils.getMemberIdByJwtToken(request);
        return R.ok().put("userInfo", info);
    }

    // 根据日期统计注册人数
    @GetMapping("/get/register/num/{day}")
    public R countRegisterNum(@PathVariable("day") String day) {
        Integer num = memberService.countRegisterNum(day);
        return R.ok().put("registerNum", num);
    }

    // 更改个人资料 和 头像都会返回token
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public R edit(@RequestBody Member member) {
        memberService.updateById(member);

        JwtInfo jwtInfo = new JwtInfo();
        jwtInfo.setId(member.getId());
        jwtInfo.setAvatar(member.getAvatar());
        jwtInfo.setNickname(member.getNickname());
        String token = JwtUtils.getJwtToken(jwtInfo, 7200);

        return R.ok().put("token", token);
    }

    // 查询用户
    @RequestMapping(value = "/select", method = RequestMethod.POST)
    public R select(HttpServletRequest request) {
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        if(StringUtils.isEmpty(memberId)) {
            throw new XliException(20001, "请您先登录");
        }
        Member member = memberService.getById(memberId);
        return R.ok().put("member", member);
    }

    // 验证验证码是否正确
    @RequestMapping(value = "/check/{code}", method = RequestMethod.POST)
    public R checkCode(@RequestBody Member member,@PathVariable("code") String code) {
        String mobile = member.getMobile();
        // 1. 验证.
        if(StringUtils.isEmpty(code) || StringUtils.isEmpty(mobile)) {
            throw new XliException(20001, "验证码错误o(╥﹏╥)o");
        }
        String redisCode = (String)redisTemplate.opsForValue().get(mobile);
        if(StringUtils.isEmpty(redisCode) || !redisCode.equals(code)) {
            throw new XliException(20001, "验证码错误o(╥﹏╥)o");
        }
        return R.ok();
    }

    // 绑定手机第二步, 验证绑定的手机号是否已经存在和检验验证码
    @RequestMapping(value = "/check/mobile/{code}", method = RequestMethod.POST)
    public R checkMobileCode(@RequestBody Member member,@PathVariable("code") String code) {
        String mobile = member.getMobile();
        String redisCode = (String)redisTemplate.opsForValue().get(mobile);
        // 1. 验证
        if(StringUtils.isEmpty(code) || StringUtils.isEmpty(mobile)) {
            throw new XliException(20001, "验证码错误o(╥﹏╥)o");
        }
        QueryWrapper<Member> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        int count = memberService.count(wrapper);
        if(count > 0) { // 存在手机号
            throw new XliException(20001, "该手机号已被注册o(╥﹏╥)o");
        }else if(StringUtils.isEmpty(redisCode) || !redisCode.equals(code)) { // 验证码错误
            throw new XliException(20001, "验证码错误o(╥﹏╥)o");
        }else {
            return R.ok();
        }
    }

    // 更新用户密码
    @RequestMapping(value = "/update/{password}", method = RequestMethod.POST)
    public R updatePassword(@RequestBody Member member, @PathVariable String password) {
        member.setPassword(MD5Utils.encrypt(password));
        memberService.updateById(member);
        return R.ok();
    }

}
