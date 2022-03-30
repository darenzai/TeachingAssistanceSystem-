package com.hujiayi.auxiliaryteach.ums.service.feign.fallback;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ums.service.feign.EduFeignService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class EduFeignServiceFallBack implements EduFeignService {

    @Override
    public CourseDto getCourseDtoById(String courseId) {
        log.info("熔断保护");
        return null;
    }

    @Override
    public R updateBuyCountById(String id) {
        log.info("熔断保护");
        return null;
    }

}
