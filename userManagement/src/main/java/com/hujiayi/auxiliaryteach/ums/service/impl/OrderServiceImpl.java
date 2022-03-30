package com.hujiayi.auxiliaryteach.ums.service.impl;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.ums.entity.Member;
import com.hujiayi.auxiliaryteach.ums.entity.Order;
import com.hujiayi.auxiliaryteach.ums.mapper.OrderMapper;
import com.hujiayi.auxiliaryteach.ums.service.MemberService;
import com.hujiayi.auxiliaryteach.ums.service.OrderService;
import com.hujiayi.auxiliaryteach.ums.service.feign.EduFeignService;
import com.hujiayi.auxiliaryteach.ums.utils.OrderNoUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@Slf4j
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private EduFeignService eduFeignService;

    @Autowired
    private MemberService memberService;

    // 返回订单号
    @Override
    public String saveOrder(String courseId, String memberId) {
        // 1. 通过用户id和课程id去查询订单,是否存在,如果存在则之间返回订单id.
        QueryWrapper<Order> orderWrapper = new QueryWrapper<>();
        orderWrapper.eq("course_id", courseId);
        orderWrapper.eq("member_id", memberId);
        Order existOrder = this.baseMapper.selectOne(orderWrapper);
        if(existOrder != null) {
            return existOrder.getId();
        }
        // 2. 查询课程信息
        CourseDto courseDto = eduFeignService.getCourseDtoById(courseId);

        if(courseDto == null) {
            log.error("课程信息异常o(╥﹏╥)o");
            throw new XliException(20001, "课程信息异常o(╥﹏╥)o");
        }

        // 3. 查询用户信息
        Member member = memberService.getMemberInfoById(memberId);

        if(member == null) {
            log.error("用户信息异常(╥﹏╥)o");
            throw new XliException(20001, "用户信息异常o(╥﹏╥)o");
        }

        // 4. 插入订单, 返回订单id
        Order order = new Order();
        order.setOrderNo(OrderNoUtils.getOrderNo());
        order.setCourseId(courseId);
        order.setCourseTitle(courseDto.getTitle());
        order.setCourseCover(courseDto.getCover());
        order.setTeacherName(courseDto.getTeacherName());
        order.setTotalFee(courseDto.getPrice().multiply(new BigDecimal(100)));//分
        order.setMemberId(memberId);
        order.setMobile(member.getMobile());
        order.setNickname(member.getNickname());
        order.setStatus(0);//未支付
        order.setPayType(1);//微信支付

        // 插入
        baseMapper.insert(order);

        // 返回订单id
        return order.getId();
    }

    // 根据id, 获取订单号
    @Override
    public Order getOrderById(String orderId, String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("id", orderId);
        wrapper.eq("member_id", memberId);
        Order order = this.getOne(wrapper);
        return order;
    }

    //
    @Override
    public Boolean getCourseStatusById(String courseId, String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        wrapper.eq("member_id", memberId);
        wrapper.eq("status", 1);
        Integer count = this.baseMapper.selectCount(wrapper);
        return count.intValue() > 0;
    }

    // 获取当前用户订单列表
    @Override
    public List<Order> getMemberOrderListById(String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("member_id", memberId);
        wrapper.orderByDesc("gmt_create");
        return this.baseMapper.selectList(wrapper);
    }

    // 删除订单接口
    @Override
    public Boolean deleteOrderById(String orderId, String memberId) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("id", orderId);
        wrapper.eq("member_id", memberId);
        return this.remove(wrapper);
    }

    // 根据订单号获取订单.
    @Override
    public Order getOrderByOrderNo(String orderNo) {
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderNo);
        return this.getOne(wrapper);
    }

}
