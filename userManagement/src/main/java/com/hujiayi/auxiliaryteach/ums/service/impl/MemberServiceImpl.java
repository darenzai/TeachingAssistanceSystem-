package com.hujiayi.auxiliaryteach.ums.service.impl;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.common.utils.MD5Utils;
import com.hujiayi.auxiliaryteach.common.utils.MobileUtils;
import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.hujiayi.auxiliaryteach.ums.mapper.MemberMapper;
import com.hujiayi.auxiliaryteach.ums.service.MemberService;
import com.hujiayi.auxiliaryteach.ums.vo.LoginVo;
import com.hujiayi.auxiliaryteach.ums.vo.RegisterVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements MemberService {


    @Autowired
    private RedisTemplate redisTemplate;

    // 注册用户根据手机号
    @Override
    public void registerMemberByMobile(RegisterVo registerVo) {

        // 1. 获取RegisterVo中的内容
        String code = registerVo.getCode();
        String mobile = registerVo.getMobile();
        String nickname = registerVo.getNickname();
        String password = registerVo.getPassword();

        // 2. 校验
        if(StringUtils.isEmpty(code) || !MobileUtils.isMobile(mobile)
                || StringUtils.isEmpty(mobile) || StringUtils.isEmpty(nickname)
                || StringUtils.isEmpty(password)) {
            throw new XliException(20001, "注册信息错误o(╥﹏╥)o");
        }

        // 3. 获取redis中的验证码
        String checkCode = (String)redisTemplate.opsForValue().get(mobile);

        // 4. 对拿到的验证码进行验证
        if(StringUtils.isEmpty(checkCode) || !code.equals(checkCode)) {
            throw new XliException(20001, "获取验证码异常o(╥﹏╥)o");
        }

        // 5. 判断当前用户是否已经注册
        QueryWrapper<Member> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        // 通过查询条件拿到记录
        Integer num = this.baseMapper.selectCount(wrapper);

        // 6. 判断num是否大于0, 如果大于表示存在数据
        if(num > 0) {
            throw new XliException(20001, "用户已存在o(╥﹏╥)o");
        }

        // 7. 注册用户操作
        Member member = new Member();
        member.setMobile(mobile);
        member.setNickname(nickname);
        // 用户的密码使用md5加密
        member.setPassword(MD5Utils.encrypt(password));
        member.setIsDisabled(false);
        // 设置用户默认的头像
        member.setAvatar("https://xueliedu.oss-cn-beijing.aliyuncs.com/avatar/default.jpg");

        this.save(member);
    }

    // 登录业务
    @Override
    public String loginMember(LoginVo loginVo) {
        // 1. 对数据进行校验
        String mobile = loginVo.getMobile();
        String password = loginVo.getPassword();

        if(StringUtils.isEmpty(mobile) || !MobileUtils.isMobile(mobile)) {
            throw new XliException(20001, "用户手机号码错误o(╥﹏╥)o");
        }
        if(StringUtils.isEmpty(password)) {
            throw new XliException(20001, "用户密码不存在o(╥﹏╥)o");
        }

        // 2. 与数据库中的数据进行比较, 根据手机号查询数据库,
        // 如果找到了, 进行判断密码是否正确, 否则就表示用户不存在. 需要先注册
        QueryWrapper<Member> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        Member member = this.baseMapper.selectOne(wrapper); //getOne(wrapper);
        if(member == null || !member.getPassword().equals(MD5Utils.encrypt(password))) {
            throw new XliException(20001, "用户信息错误");
        }

        //检验用户是否被禁用
        if(member.getIsDisabled()){
            throw new XliException(20001, "登录异常o(╥﹏╥)o");
        }

        // 3. 用户验证成功, 生成Token
        JwtInfo jwtInfo = new JwtInfo();
        jwtInfo.setId(member.getId());
        jwtInfo.setNickname(member.getNickname());
        jwtInfo.setAvatar(member.getAvatar());
        // 生成token, 过期时间为 1800秒, 30分钟
        String token = JwtUtils.getJwtToken(jwtInfo, 7200);

        return token;
    }

    // 根据openid, 获取对象
    @Override
    public Member getMemberByOpenId(String openId) {
        QueryWrapper<Member> wrapper = new QueryWrapper<>();
        wrapper.eq("openid", openId);
        return this.getOne(wrapper);
    }

    // 根据用户id, 查询用户
    @Override
    public Member getMemberInfoById(String id) {
        return this.getById(id);
    }

    // 根据天数, 统计该天注册的人数
    @Override
    public Integer countRegisterNum(String day) {
        return baseMapper.selectRegisterNumByDay(day);
    }
}
