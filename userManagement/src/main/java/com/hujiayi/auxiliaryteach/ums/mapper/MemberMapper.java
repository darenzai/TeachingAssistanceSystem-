package com.hujiayi.auxiliaryteach.ums.mapper;

import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 会员表 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
public interface MemberMapper extends BaseMapper<Member> {

    Integer selectRegisterNumByDay(String day);
}
