package com.hujiayi.auxiliaryteach.ums.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 生成订单号工具
 */
public class OrderNoUtils {

    /**
     * 获取订单号
     * @return
     */
    public static String getOrderNo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();
        for (int i = 0; i < 3; i++) {
            result += random.nextInt(10);
        }
        return newDate + result;
    }

    public static void main(String[] args) {
        System.out.println("OrderNoUtils:" + OrderNoUtils.getOrderNo());
    }

}
