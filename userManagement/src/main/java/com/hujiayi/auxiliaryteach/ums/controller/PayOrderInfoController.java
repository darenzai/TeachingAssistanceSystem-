package com.hujiayi.auxiliaryteach.ums.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ums.service.PayOrderInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 * 支付日志表 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@Slf4j
@RestController
@RequestMapping("/ums/order/pay/info")
public class PayOrderInfoController {

    @Autowired
    private PayOrderInfoService payOrderInfoService;

    // 1. 根据订单号, 查询订单状态
    @GetMapping("/get/status/{orderNo}")
    public R getPayStatus(@PathVariable("orderNo") String orderNo) {
        // 1. 发送请求, 查询订单状态,
        Map<String, String> map = payOrderInfoService.getPayStatus(orderNo);
        log.info(orderNo + " -> 订单状态 ->" + map);
        if(map == null) {
            return R.error().message("支付异常o(╥﹏╥)o");
        }
        // 2. 如果订单成功, 修向支付订单信息表中插入一条记录
        if("SUCCESS".equals(map.get("trade_state"))) { // 支付成功
            payOrderInfoService.updatePaymentStatus(map);
            return R.ok().message("支付成功");
        }
        return R.ok().code(25000).message("支付中");
    }


}

