package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.ems.entity.ChoiceQuestion;
import com.hujiayi.auxiliaryteach.ems.service.ChoiceQuestionService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-08-09
 */
@Slf4j
@RestController
@RequestMapping("/ems/question/choice")
public class ChoiceQuestionController {

    @Autowired
    private ChoiceQuestionService choiceQuestionService;

    public void edit(ChoiceQuestion choiceQuestion) {
        if(choiceQuestion.getId() == null) {
            log.info("choiceQuestion:" + choiceQuestion);
            choiceQuestionService.save(choiceQuestion);
        }else {
            choiceQuestionService.updateById(choiceQuestion);
        }
    }

    public void delete(Integer id, String questionType) {
        QueryWrapper<ChoiceQuestion> wrapper = new QueryWrapper<>();
        wrapper.eq("id", id);
        wrapper.eq("question_type", questionType);
        choiceQuestionService.remove(wrapper);
    }

    public ChoiceQuestion select(String questionType, Integer id) {
        QueryWrapper<ChoiceQuestion> wrapper = new QueryWrapper<>();
        wrapper.eq("question_type", questionType);
        wrapper.eq("id", id);
        ChoiceQuestion choiceQuestion = choiceQuestionService.getOne(wrapper);
        return choiceQuestion;
    }
}

