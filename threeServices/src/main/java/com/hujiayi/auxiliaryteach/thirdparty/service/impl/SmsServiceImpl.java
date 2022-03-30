package com.hujiayi.auxiliaryteach.thirdparty.service.impl;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.thirdparty.service.SmsService;
import com.hujiayi.auxiliaryteach.thirdparty.utils.ConstantPropertyUtils;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class SmsServiceImpl implements SmsService {

    // 发送验证码
    @Override
    public void send(String mobile, String checkCode) throws ClientException {
        // 1. 调用短信发送SDK, 创建client对象
        DefaultProfile profile = DefaultProfile.getProfile("default", ConstantPropertyUtils.ACCESS_KEY_ID,
                ConstantPropertyUtils.ACCESS_KEY_SECRET);
        IAcsClient client = new DefaultAcsClient(profile);
        // 2. 组装请求参数
        CommonRequest request = new CommonRequest();

        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");

        request.putQueryParameter("PhoneNumbers", mobile);
        request.putQueryParameter("SignName", "大数据学院教学辅助在线教育网站");
        request.putQueryParameter("TemplateCode", "SMS_191490032");

        // 3. 设置 TemplateParam
        Map<String, Object> param = new HashMap<>(16);
        param.put("code", checkCode);
        Gson gson = new Gson();
        // 将map转换为json字符串
        request.putQueryParameter("TemplateParam", gson.toJson(param));

        // 4. 进行发送
        CommonResponse response = client.getCommonResponse(request);

        // 5. 得到json字符串的响应格式
        String data = response.getData();

        // 6. 解析json字符串格式的响应结果
        HashMap<String, String> hashMap = gson.fromJson(data, HashMap.class);
        String code = hashMap.get("Code");
        String message = hashMap.get("Message");


        if ("isv.BUSINESS_LIMIT_CONTROL".equals(code)) {
            log.error("短信发送过于频繁 " + "【code】" + code + ", 【message】" + message);
            throw new XliException(20001, "短信发送过于频繁o(╥﹏╥)o");
        }

        if (!"OK".equals(code)) {
            log.error("短信发送失败 " + " - code: " + code + ", message: " + message);
            throw new XliException(20001, "短信发送失败o(╥﹏╥)o");
        }
    }
}
