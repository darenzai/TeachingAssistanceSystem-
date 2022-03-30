package com.hujiayi.auxiliaryteach.ums.service;

import com.hujiayi.auxiliaryteach.ums.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 订单 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
public interface OrderService extends IService<Order> {

    String saveOrder(String courseId, String memberId);

    Order getOrderById(String orderId, String memberId);

    Boolean getCourseStatusById(String courseId, String memberId);

    List<Order> getMemberOrderListById(String memberId);

    Boolean deleteOrderById(String orderId, String memberId);

    Order getOrderByOrderNo(String orderNo);
}
