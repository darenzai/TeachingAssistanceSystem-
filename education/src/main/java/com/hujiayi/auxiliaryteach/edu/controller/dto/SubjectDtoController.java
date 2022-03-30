package com.hujiayi.auxiliaryteach.edu.controller.dto;

import com.hujiayi.auxiliaryteach.common.dto.SubjectDto;
import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import com.hujiayi.auxiliaryteach.edu.service.SubjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/edu/subject/dto")
public class SubjectDtoController {

    @Autowired
    private SubjectService subjectService;

    @RequestMapping(value = "/select/{id}", method = RequestMethod.POST)
    public SubjectDto select(@PathVariable("id") String id) {
        Subject subject = subjectService.getById(id);
        SubjectDto subjectDto = new SubjectDto();
        BeanUtils.copyProperties(subject, subjectDto);
        return subjectDto;
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<SubjectDto> list() {
        List<SubjectDto> subjectDtoList = new ArrayList<>();
        List<Subject> subjectList = subjectService.list();
        subjectList.forEach(item -> {
            SubjectDto subjectDto = new SubjectDto();
            BeanUtils.copyProperties(item,subjectDto);
            subjectDtoList.add(subjectDto);
        });
        log.info("subjectDtoList:" + subjectDtoList);
        return subjectDtoList;
    }
//    public List<OneLevelSubjectDto> list() {
//        return subjectService.subjectDtoList();
//    }

}
