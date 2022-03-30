package com.hujiayi.auxiliaryteach.ums.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.hujiayi.auxiliaryteach.ums.entity.Order;
import com.hujiayi.auxiliaryteach.ums.entity.PayOrderInfo;
import com.hujiayi.auxiliaryteach.ums.mapper.PayOrderInfoMapper;
import com.hujiayi.auxiliaryteach.ums.prop.WxPayProperties;
import com.hujiayi.auxiliaryteach.ums.service.OrderService;
import com.hujiayi.auxiliaryteach.ums.service.PayOrderInfoService;
import com.hujiayi.auxiliaryteach.ums.service.feign.EduFeignService;
import com.hujiayi.auxiliaryteach.ums.utils.HttpClientUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 支付日志表 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
@Service
public class PayOrderInfoServiceImpl extends ServiceImpl<PayOrderInfoMapper, PayOrderInfo> implements PayOrderInfoService {

    @Autowired
    private WxPayProperties wxPayProperties;

    @Autowired
    private OrderService orderService;

    @Autowired
    private EduFeignService eduFeignService;

    // 1. 发送请求, 获取订单状态
    @Override
    public Map<String, String> getPayStatus(String orderNo) {
        try {
            // 1. 封装参数
            Map paramMap = new HashMap(16);

            paramMap.put("appid", wxPayProperties.getAppid());
            paramMap.put("mch_id", wxPayProperties.getPartner());
            paramMap.put("out_trade_no", orderNo);
            paramMap.put("nonce_str", WXPayUtil.generateNonceStr());

            // 2、设置请求
            HttpClientUtils client = new HttpClientUtils("https://api.mch.weixin.qq.com/pay/orderquery");
            client.setXmlParam(WXPayUtil.generateSignedXml(paramMap, wxPayProperties.getPartnerkey()));
            client.setHttps(true);
            client.post();

            // 3、返回第三方的数据
            String xml = client.getContent();
            Map<String, String> resultMap = WXPayUtil.xmlToMap(xml);

            return resultMap;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 2. 更新支付订单信息表
    @Override
    public void updatePaymentStatus(Map<String, String> map) {
        // 1. 获取订单号
        String orderNo = map.get("out_trade_no");

        // 2. 根据订单号 查询订单信息
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderNo);
        Order order = orderService.getOne(wrapper);

        if(order.getStatus().intValue() == 1) {
            return;
        }
        // 3. 设置订单状态
        order.setStatus(1);
        orderService.updateById(order);

        // 4. 给支付记录表中, 添加一条支付信息
        PayOrderInfo paymentInfo = new PayOrderInfo();

        paymentInfo.setOrderNo(order.getOrderNo()); //支付订单号
        paymentInfo.setPayTime(new Date());
        paymentInfo.setPayType(1); //支付类型
        paymentInfo.setTotalFee(order.getTotalFee()); //总金额(分)
        paymentInfo.setTradeState(map.get("trade_state")); //支付状态
        paymentInfo.setTransactionId(map.get("transaction_id"));
        paymentInfo.setAttr(JSONObject.toJSONString(map));

        baseMapper.insert(paymentInfo);//插入到支付日志表

        // 5. 更新课程销量,
        String courseId = order.getCourseId();
        eduFeignService.updateBuyCountById(courseId);
    }
}
