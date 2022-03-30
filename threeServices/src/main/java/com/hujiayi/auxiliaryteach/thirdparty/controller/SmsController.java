package com.hujiayi.auxiliaryteach.thirdparty.controller;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.thirdparty.service.SmsService;
import com.hujiayi.auxiliaryteach.common.utils.MobileUtils;
import com.hujiayi.auxiliaryteach.thirdparty.utils.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/thirdparty/sms")
public class SmsController {

    @Autowired
    private SmsService smsService;

    @Autowired
    private RedisTemplate redisTemplate;

    // 给手机号发送验证码功能
    @GetMapping("/send/code/{mobile}")
    public R sendMobileCode(@PathVariable("mobile") String mobile) {
        // 1. 对手机号进行验证
        if(StringUtils.isEmpty(mobile) || !MobileUtils.isMobile(mobile)) {
            return R.error("手机号错误");
        }
        // 2. 生成验证码(6位)
        String checkCode = RandomUtils.getSixBitRandom();
        // 3. 给手机号发送验证码
//        try {
//            smsService.send(mobile, checkCode);
            // 4. 发送成功, 将验证码放入redis中, 时间为5分钟, 5分钟后验证码失效
            redisTemplate.opsForValue().set(mobile, checkCode, 5, TimeUnit.MINUTES);
            return R.ok();
//        } catch (ClientException e) {
//            e.printStackTrace();
//            throw new XliException(20001, "发送验证码异常o(╥﹏╥)o");
//        }
    }

}
