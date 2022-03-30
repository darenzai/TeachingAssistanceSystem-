package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.ems.entity.ShortAnswerQuestion;
import com.hujiayi.auxiliaryteach.ems.service.ShortAnswerQuestionService;
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
@RestController
@RequestMapping("/ems/question/short/answer")
public class ShortAnswerQuestionController {

    @Autowired
    private ShortAnswerQuestionService shortAnswerQuestionService;

    public void edit(ShortAnswerQuestion shortAnswerQuestion) {
        if(shortAnswerQuestion.getId() == null) {
            shortAnswerQuestionService.save(shortAnswerQuestion);
        }else {
            shortAnswerQuestionService.updateById(shortAnswerQuestion);
        }
    }

    public void delete(Integer id) {
        shortAnswerQuestionService.removeById(id);
    }

    public ShortAnswerQuestion select(Integer id) {
        return shortAnswerQuestionService.getById(id);
    }
}

