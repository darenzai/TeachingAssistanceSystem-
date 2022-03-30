package com.hujiayi.auxiliaryteach.ums.controller;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ums.service.WxPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/ums/wx/pay")
public class WxPayController {

    @Autowired
    private WxPayService wxPayService;

    // 根据订单号, 请求微信, 返回支付二维码
    @GetMapping("/get/qrcode/{orderNo}")
    public R getWxQrCodeByOrderNo(@PathVariable("orderNo") String orderNo) {
        Map map = wxPayService.getWxQrCodeById(orderNo);
        return R.ok().put(map);
    }
}
