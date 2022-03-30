package com.hujiayi.auxiliaryteach.ums.service.feign;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ums.service.feign.fallback.EduFeignServiceFallBack;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

@Service
@FeignClient(value = "xueliedu-edu", fallback = EduFeignServiceFallBack.class)
public interface EduFeignService {

    // 根据课程id, 返回CourseDto, 用于远程调用
    @GetMapping("/edu/front/course/get/course/dto/{courseId}")
    public CourseDto getCourseDtoById(@PathVariable("courseId") String courseId);


    @PutMapping("/edu/front/course/update/buycount/{id}")
    public R updateBuyCountById(@PathVariable("id") String id);

}
