package com.hujiayi.auxiliaryteach.edu.service.feign.fallback;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.feign.VodFeignService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * VodFeignService服务的回调函数
 */
@Service
@Slf4j
public class VodFeignServiceFallBack implements VodFeignService {

    @Override
    public R deleteVideById(String id) {
        log.info("熔断保护...");
        return R.error();
    }

    @Override
    public R deleteVideoByIds(List<String> ids) {
        log.info("熔断保护...");
        return R.error();
    }
}
