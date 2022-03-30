package com.hujiayi.auxiliaryteach.ums.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.ums.entity.Order;
import com.hujiayi.auxiliaryteach.ums.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@RestController
@RequestMapping("/ums/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // 新增订单
    @PostMapping("/save/auth/{courseId}")
    public R addOrder(@PathVariable("courseId") String courseId, HttpServletRequest request) {
        // 1. 通过前端的请求, 中Heards这个头中信息, 拿到token, 使用jwt工具解析, 拿到用户信息
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        // 2. 返回订单id
        String orderId = orderService.saveOrder(courseId, memberId);
        return R.ok().put("orderId", orderId);
    }

    // 根据订单id和用户id, 获取订单号,
    @GetMapping("/get/order/{orderId}")
    public R getOrderById(@PathVariable("orderId") String orderId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        // 2. 通过订单id 和 用户id 查询订单
        String memberId = jwtInfo.getId();
        Order order = orderService.getOrderById(orderId, memberId);
        return R.ok().put("order", order);
    }

    // 获取课程状态, 是否购买
    @GetMapping("/get/course/status/{courseId}")
    public R getCourseStatusById(@PathVariable("courseId") String courseId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        // 2. ...
        String memberId = jwtInfo.getId();
        // 3. ...
        Boolean status = orderService.getCourseStatusById(courseId, memberId);
        return R.ok().put("status", status);
    }

    // 用户订单列表
    @GetMapping("/get/member/order/list")
    public R getMemberOrderList(HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        // 2. ...
        String memberId = jwtInfo.getId();
        // 3. 获取订单列表
        List<Order> orderList =  orderService.getMemberOrderListById(memberId);
        return R.ok().put("orderList", orderList);
    }

    // 删除订单接口
    @DeleteMapping("/delete/order/{orderId}")
    public R deleteOrderById(@PathVariable("orderId") String orderId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        // 2. ...
        String memberId = jwtInfo.getId();
        Boolean result = orderService.deleteOrderById(orderId, memberId);
        return result?R.ok():R.error().message("数据不存在");
    }

}

