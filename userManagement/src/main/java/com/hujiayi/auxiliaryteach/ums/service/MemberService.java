package com.hujiayi.auxiliaryteach.ums.service;

import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.hujiayi.auxiliaryteach.ums.vo.LoginVo;
import com.hujiayi.auxiliaryteach.ums.vo.RegisterVo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
public interface MemberService extends IService<Member> {

    void registerMemberByMobile(RegisterVo registerVo);

    String loginMember(LoginVo loginVo);

    Member getMemberByOpenId(String openId);

    Member getMemberInfoById(String id);

    Integer countRegisterNum(String day);
}
