package com.hujiayi.auxiliaryteach.ems.service.feign;

import com.hujiayi.auxiliaryteach.common.dto.ChapterDto;
import com.hujiayi.auxiliaryteach.common.dto.SubjectDto;
import com.hujiayi.auxiliaryteach.ems.service.feign.fallback.EduFeignServiceFallBack;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Service
@FeignClient(value = "xueliedu-edu", fallback = EduFeignServiceFallBack.class)
public interface EduFeignService {

    @RequestMapping(value = "/edu/subject/dto/select/{id}", method = RequestMethod.POST)
    public SubjectDto select(@PathVariable("id") String id);

    @RequestMapping(value = "/edu/subject/dto/list", method = RequestMethod.POST)
    public List<SubjectDto> list();

    @RequestMapping(value = "/edu/chapter/dto/select/{id}", method = RequestMethod.POST)
    public ChapterDto selectChapter(@PathVariable("id") String id);

}
