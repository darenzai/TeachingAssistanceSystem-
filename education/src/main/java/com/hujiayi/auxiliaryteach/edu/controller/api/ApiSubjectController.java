package com.hujiayi.auxiliaryteach.edu.controller.api;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.SubjectService;
import com.hujiayi.auxiliaryteach.edu.vo.OneLevelSubjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 前台学科接口
 */
@RestController
@RequestMapping("/edu/front/subject")
public class ApiSubjectController {

    @Autowired
    private SubjectService subjectService;

    @GetMapping("/get/subject/list")
    public R multiLevelSubjectList() {
        List<OneLevelSubjectVo> subjects = subjectService.getAllSubjects();
        return R.ok().put("items", subjects);
    }
}
