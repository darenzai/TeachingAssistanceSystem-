package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.ems.entity.Answer;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.entity.ScoreManage;
import com.hujiayi.auxiliaryteach.ems.service.AnswerService;
import com.hujiayi.auxiliaryteach.ems.service.ScoreManageService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-08-24
 */
@RestController
@RequestMapping("/ems/score")
public class ScoreManageController {

    @Autowired
    private ScoreManageService scoreManageService;

    @Autowired
    private AnswerService answerService;

    public ScoreManage edit(ExamManage examManage, String memberId) {

        ScoreManage scoreManage = new ScoreManage();
        scoreManage.setExamId(examManage.getId());
        scoreManage.setMemberId(memberId);
        scoreManage.setCourseId(examManage.getCourseId());

        if(examManage.getChapterId() != null) {
            scoreManage.setChapterId(examManage.getChapterId());
        }
        QueryWrapper<ScoreManage> wrapper = new QueryWrapper<>();
        wrapper.eq("member_id", memberId);
        wrapper.eq("exam_id", examManage.getId());
        wrapper.orderByDesc("number");

        List<ScoreManage> list = scoreManageService.list(wrapper);
        if(list.size() > 0 && list != null) {
            ScoreManage oldScoreManage = list.get(0);
            Integer number = oldScoreManage.getNumber();
            if(number != 3) {
                scoreManage.setNumber(number + 1);
            }
        }else {
            scoreManage.setNumber(1);
        }

        // 1. 设置考试得分，
        QueryWrapper<Answer> answerWrapper = new QueryWrapper<>();
        answerWrapper.eq("paper_id", examManage.getPaperId());
        answerWrapper.eq("number", scoreManage.getNumber());
        answerWrapper.eq("member_id", memberId);
        List<Answer> answerList = answerService.list(answerWrapper);

        Integer score = 0;

        for (Answer item : answerList) {
            Integer itemScore = item.getScore();
            score = score + itemScore;
        }
        scoreManage.setExamScore(score);

        // 2. 插入数据库
        scoreManageService.save(scoreManage);
        return scoreManage;
    }

}

