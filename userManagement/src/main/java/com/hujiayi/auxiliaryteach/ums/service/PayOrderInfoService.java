package com.hujiayi.auxiliaryteach.ums.service;

import com.hujiayi.auxiliaryteach.ums.entity.PayOrderInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 支付日志表 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-31
 */
public interface PayOrderInfoService extends IService<PayOrderInfo> {

    Map<String, String> getPayStatus(String orderNo);

    void updatePaymentStatus(Map<String, String> map);
}
