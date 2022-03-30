package com.hujiayi.auxiliaryteach.ums.service.impl;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.ums.entity.Order;
import com.hujiayi.auxiliaryteach.ums.prop.WxPayProperties;
import com.hujiayi.auxiliaryteach.ums.service.OrderService;
import com.hujiayi.auxiliaryteach.ums.service.WxPayService;
import com.hujiayi.auxiliaryteach.ums.utils.HttpClientUtils;
import com.github.wxpay.sdk.WXPayUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class WxPayServiceImpl implements WxPayService {

    @Autowired
    private OrderService orderService;

    @Autowired
    private WxPayProperties wxPayProperties;

    // 根据订单号, 请求微信, 返回支付二维码
    @Override
    public Map getWxQrCodeById(String orderNo) {
        try {
            // 1. 获取订单信息
            Order order = orderService.getOrderByOrderNo(orderNo);

            // 2. 封装一个map, 设置支付参数
            Map<String, String> m = new HashMap<>(16);
            m.put("appid", wxPayProperties.getAppid()); // 关联的公众号的appid
            m.put("mch_id", wxPayProperties.getPartner()); // 商户号
            m.put("nonce_str", WXPayUtil.generateNonceStr()); // 生成随机字符串
            m.put("body", order.getCourseTitle());
            m.put("out_trade_no", orderNo);

            //注意，这里必须使用字符串类型的参数（总金额：分） 扩大100倍, 等会在前端页面缩小100倍
            String totalFee = order.getTotalFee().intValue() + "";
            log.info("totalFee:" + totalFee);
            m.put("total_fee", totalFee);
            m.put("spbill_create_ip", "127.0.0.1");
            m.put("notify_url", wxPayProperties.getNotifyurl());
            m.put("trade_type", "NATIVE");

            // 3. 调用微信api接口：统一下单（支付订单）
            HttpClientUtils client = new HttpClientUtils("https://api.mch.weixin.qq.com/pay/unifiedorder");

            // 4. 将参数转换成xml字符串格式：生成带有签名的xml格式字符串
            String xmlParams = WXPayUtil.generateSignedXml(m, wxPayProperties.getPartnerkey());
            log.info("\n xmlParams：\n" + xmlParams);

            // 5. 将参数放入请求对象的方法体，使用https形式发送，发送请求
            client.setXmlParam(xmlParams);
            client.setHttps(true);
            client.post();

            // 6. 得到响应结果，将xml响应结果转成map对象
            String resultXml = client.getContent();
            log.info("\n resultXml：\n" + resultXml);
            Map<String, String> resultMap = WXPayUtil.xmlToMap(resultXml);

            // 7. 错误处理
            if("FAIL".equals(resultMap.get("return_code")) || "FAIL".equals(resultMap.get("result_code"))){
                log.error("微信支付统一下单错误 - "
                        + "return_code: " + resultMap.get("return_code")
                        + "return_msg: " + resultMap.get("return_msg")
                        + "result_code: " + resultMap.get("result_code")
                        + "err_code: " + resultMap.get("err_code")
                        + "err_code_des: " + resultMap.get("err_code_des"));
                throw new XliException(20001, "微信支付错误o(╥﹏╥)o");
            }

            // 8. 组装需要的内容, 响应码, 生成二维码的url, 课程id, 订单总金额, 订单号
            Map<String, Object> map = new HashMap<>(16);
            map.put("result_code", resultMap.get("result_code"));
            map.put("code_url", resultMap.get("code_url"));
            map.put("course_id", order.getCourseId());
            map.put("total_fee", order.getTotalFee());
            map.put("out_trade_no", orderNo);

            return map;
        }catch (Exception e) {
            e.printStackTrace();
            return new HashMap<>(16);
        }
    }
}
