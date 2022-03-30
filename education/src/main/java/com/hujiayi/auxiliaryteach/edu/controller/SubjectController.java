package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.SubjectService;
import com.hujiayi.auxiliaryteach.edu.vo.OneLevelSubjectVo;
import com.hujiayi.auxiliaryteach.edu.vo.TwoLevelSubjectVo;
import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    // 解析Excel文件
    @PostMapping("/analysis/data")
    public R analysisExcelDataByEasyExcel(MultipartFile file) {
        subjectService.analysisExcelDataByEasyExcel(file, subjectService);
        return R.ok();
    }

    // 获取所有学科
    @GetMapping("/get/all/subjects")
    public R getAllSubjects() {
        List<OneLevelSubjectVo> lists = subjectService.getAllSubjects();
        return R.ok().put("subjects", lists);
    }

    // 追加学科
    @PostMapping("/append/subject")
    public R appendSubject(@RequestBody TwoLevelSubjectVo twoLevelSubjectVo) {
        subjectService.appendSubject(twoLevelSubjectVo);
        return R.ok();
    }

    // 根据id查询学科
    @GetMapping("/get/subject/{sId}")
    public R getSubjectById(@PathVariable("sId") String sId) {
        Subject subject = subjectService.getSubjectById(sId);
        return R.ok().put("subject", subject);
    }

    // 修改学科
    @PutMapping("/edit/subject")
    public R editSubject(@RequestBody TwoLevelSubjectVo twoLevelSubjectVo) {
        subjectService.editSubject(twoLevelSubjectVo);
        return R.ok();
    }

    // 删除学科
    @DeleteMapping("/delete/subject/{id}")
    public R deleteSubject(@PathVariable("id") String id) {
        subjectService.deleteSubject(id);
        return R.ok();
    }

    // 插入学科一级
    @PostMapping("/add/subject")
    public R addSubject(@RequestBody TwoLevelSubjectVo twoLevelSubjectVo) {
        subjectService.addSubject(twoLevelSubjectVo);
        return R.ok();
    }


    // 批量删除学科
    @DeleteMapping("/batch/delete/subject")
    public R batchDeleteSubjectByIds(String[] sIds) {
        subjectService.batchDeleteSubjectByIds(sIds);
        return R.ok();
    }

    /**
     * 批量保存学科
     * 前端传入的是一个json格式的数组对象, 后端使用List接受
     */
    @PostMapping("/batch/save/subject")
    public R batchSaveSubject(@RequestBody List<Subject> subjects) {
        subjectService.updateBatchById(subjects);
        return R.ok();
    }

}
