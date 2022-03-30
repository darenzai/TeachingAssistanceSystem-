package com.hujiayi.auxiliaryteach.edu.service.feign;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.feign.fallback.MemberFeignServiceFallBack;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Service
@FeignClient(value = "xueliedu-ums", fallback = MemberFeignServiceFallBack.class)
public interface MemberFeignService {

    // 根据日期统计注册人数
    @GetMapping("/ums/member/get/register/num/{day}")
    public R countRegisterNum(@PathVariable("day") String day);

}
