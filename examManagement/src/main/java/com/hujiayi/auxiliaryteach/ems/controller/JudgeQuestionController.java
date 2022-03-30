package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.ems.entity.JudgeQuestion;
import com.hujiayi.auxiliaryteach.ems.service.JudgeQuestionService;
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
@RequestMapping("/ems/question/judge")
public class JudgeQuestionController {

    @Autowired
    private JudgeQuestionService judgeQuestionService;

    public void edit(JudgeQuestion judgeQuestion) {
        if(judgeQuestion.getId() == null) {
//            System.out.println(judgeQuestion);
            judgeQuestionService.save(judgeQuestion);
        }else {
            judgeQuestionService.updateById(judgeQuestion);
        }
    }

    public void delete(Integer id) {
        judgeQuestionService.removeById(id);
    }

    public JudgeQuestion select(Integer id) {
        return judgeQuestionService.getById(id);
    }
}

