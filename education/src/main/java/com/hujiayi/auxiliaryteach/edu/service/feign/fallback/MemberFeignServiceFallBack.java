package com.hujiayi.auxiliaryteach.edu.service.feign.fallback;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.feign.MemberFeignService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MemberFeignServiceFallBack implements MemberFeignService {

    @Override
    public R countRegisterNum(String day) {
        log.info("熔断保护");
        return null;
    }
}
