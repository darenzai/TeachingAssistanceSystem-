package com.hujiayi.auxiliaryteach.ems.service.feign.fallback;

import com.hujiayi.auxiliaryteach.common.dto.ChapterDto;
import com.hujiayi.auxiliaryteach.common.dto.SubjectDto;
import com.hujiayi.auxiliaryteach.ems.service.feign.EduFeignService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class EduFeignServiceFallBack implements EduFeignService {

    @Override
    public SubjectDto select(String id) {
        log.info("=====================================熔断保护=====================================");
        return null;
    }

    @Override
    public List<SubjectDto> list() {
        log.info("=====================================熔断保护=====================================");
        return null;
    }

    @Override
    public ChapterDto selectChapter(String id) {
        log.info("=====================================熔断保护=====================================");
        return null;
    }

//    @Override
//    public List<OneLevelSubjectDto> list() {
//        log.info("=====================================熔断保护=====================================");
//        return null;
//    }
}
