package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.ems.entity.FillQuestion;
import com.hujiayi.auxiliaryteach.ems.service.FillQuestionService;
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
@RequestMapping("/ems/question/fill")
public class FillQuestionController {

    @Autowired
    private FillQuestionService fillQuestionService;

    public void edit(FillQuestion fillQuestion) {
        if(fillQuestion.getId() == null) {
            fillQuestionService.save(fillQuestion);
        }else {
            fillQuestionService.updateById(fillQuestion);
        }
    }

    public void delete(Integer id) {
        fillQuestionService.removeById(id);
    }

    public FillQuestion select(Integer id) {
        return fillQuestionService.getById(id);
    }
}

