package com.hujiayi.auxiliaryteach.ems.controller.api;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ems.controller.PaperManageController;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.service.ExamManageService;
import com.hujiayi.auxiliaryteach.ems.service.PaperManageService;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.ExamContentApiVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.QuestionApiVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.QuestionListApiVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/ems/paper/api")
public class PaperManagerApiController {

    @Autowired
    private ExamManageService examManageService;

    @Autowired
    private PaperManageService paperManageService;

    @Autowired
    private PaperManageController paperManageController;

    // 根据考试id, 查询考试及试卷信息
    @RequestMapping(value = "/select/{examId}", method = RequestMethod.POST)
    public R select(@PathVariable("examId") String examId) {
        // 1. 设置考试基本信息
        ExamManage examManage = examManageService.getById(examId);
        ExamContentApiVo examContentApiVo = new ExamContentApiVo();
        examContentApiVo.setTitle(examManage.getTitle());
        examContentApiVo.setTotalScore(examManage.getTotalScore());
        examContentApiVo.setTotalTime(examManage.getTotalTime() - 1);
        examContentApiVo.setExamId(examManage.getId());
        // 2. 设置题目
        // 2.1 根据试卷Id拿到所有题目
        Integer paperId = examManage.getPaperId();
        QueryWrapper<PaperManage> twoWrapper = new QueryWrapper<>();
        twoWrapper.eq("parent_id", paperId);
        // 二级列表
        List<PaperManage> twoLevelPaperList = paperManageService.list(twoWrapper);
        // 返回所有题目列表
        List<QuestionListApiVo> questionListVos = new ArrayList<>();
        twoLevelPaperList.forEach(item -> {
            QuestionListApiVo questionListApiVo = new QuestionListApiVo();
            questionListApiVo.setName(item.getName());
            QueryWrapper<PaperManage> threeWrapper = new QueryWrapper<>();
            threeWrapper.eq("parent_id", item.getId());
            // 三级题目列表
            List<PaperManage> threeLevelPaperList = paperManageService.list(threeWrapper);
            // 题目列表
            List<QuestionApiVo> questionApiVos = new ArrayList<>();
            questionListApiVo.setType(threeLevelPaperList.get(0).getQuestionType());
            threeLevelPaperList.forEach(question -> {
                R r = paperManageController.select(question.getQuestionType(), question.getQuestionId());
                QuestionVo questionVo = (QuestionVo)r.getData().get("questionVo");
                QuestionApiVo questionApiVo = new QuestionApiVo();
                BeanUtils.copyProperties(questionVo, questionApiVo);
                questionApiVos.add(questionApiVo);
            });
            questionListApiVo.setQuestionItems(questionApiVos);
            questionListVos.add(questionListApiVo);
        });
        examContentApiVo.setTitleItems(questionListVos);
        return R.ok().put("exam", examContentApiVo);
    }

}
