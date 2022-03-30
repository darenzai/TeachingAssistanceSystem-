package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.service.ExamManageService;
import com.hujiayi.auxiliaryteach.ems.vo.ExamQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.ExamVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
@RestController
@RequestMapping("/ems/exam")
public class ExamManageController {

    @Autowired
    private ExamManageService examManageService;

    // 1. 根据查询条件, 进行分页多条件查询
    @PostMapping("/get/exam/list/{current}/{size}")
    public R getExamListByConditionPage(@RequestBody ExamQueryVo examQueryVo,
                                        @PathVariable("current") Long current,
                                        @PathVariable("size") Long size) {
        Map<String, Object> map = examManageService.getExamListByConditionPage(examQueryVo, current, size);
        long total = (long)map.get("total");
        List<ExamManage> recodes = (List<ExamManage>)map.get("recodes");
        return R.ok().put("total", total).put("recodes", recodes);
    }

    // 2. 根据key来查询考试标题
    @GetMapping("/get/exam/title/{key}")
    public R getExamTitleListByKey(@PathVariable String key) {
        List<Map<String, Object>> examTitleList = examManageService.getExamTitleListByKey(key);
        return R.ok().put("examTitleList", examTitleList);
    }

    // 3. 根据id删除考试
    @DeleteMapping("/delete/exam/{id}")
    public R deleteExamById(@PathVariable("id") String id) {
        examManageService.removeById(id);
        return R.ok();
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public R edit(@RequestBody ExamVo examVo) {
        if(StringUtils.isEmpty(examVo.getId())) {
            examManageService.insertExam(examVo);
        }else {
            examManageService.updateExam(examVo);
        }
        return R.ok();
    }

    @RequestMapping(value = "/select/{id}", method = RequestMethod.POST)
    public R select(@PathVariable("id") String id) {
        ExamVo examVo = examManageService.select(id);
        return R.ok().put("examVo", examVo);
    }

}

