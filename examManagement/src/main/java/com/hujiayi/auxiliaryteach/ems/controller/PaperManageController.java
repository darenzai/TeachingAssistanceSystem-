package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.common.constans.XliEduConstant;
import com.hujiayi.auxiliaryteach.common.dto.SubjectDto;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.ems.utils.LetterArraySortUtils;
import com.hujiayi.auxiliaryteach.ems.entity.ChoiceQuestion;
import com.hujiayi.auxiliaryteach.ems.entity.FillQuestion;
import com.hujiayi.auxiliaryteach.ems.entity.JudgeQuestion;
import com.hujiayi.auxiliaryteach.ems.entity.ShortAnswerQuestion;
import com.hujiayi.auxiliaryteach.ems.service.PaperManageService;
import com.hujiayi.auxiliaryteach.ems.service.feign.EduFeignService;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionResultVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
@Slf4j
@RestController
@RequestMapping("/ems/paper")
public class PaperManageController {

    @Autowired
    private ChoiceQuestionController choiceQuestionController;

    @Autowired
    private JudgeQuestionController judgeQuestionController;

    @Autowired
    private FillQuestionController fillQuestionController;

    @Autowired
    private ShortAnswerQuestionController shortAnswerQuestionController;

    @Autowired
    private PaperManageService paperManageService;

    @Autowired
    private EduFeignService eduFeignService;

    @RequestMapping(value = "/page/{current}/{size}", method = RequestMethod.POST)
    public R pageList(@RequestBody QuestionQueryVo questionQueryVo,
                      @PathVariable("current") Long current,
                      @PathVariable("size") Long size) {
        // 1. 第一步通过查询, 获取所有选择题, 多选题, 填空题, 判断题, 简答题的信息
        IPage<QuestionResultVo> page = paperManageService.pageList(questionQueryVo, current, size);
        List<QuestionResultVo> questionResultList = page.getRecords();

        // 2. 获取所学学科信息
        // 如果说有学科查询的条件, 那么就根据查询的条件去获取学科的名称
        String subjectId = questionQueryVo.getSubjectId();
        String subjectParentId = questionQueryVo.getSubjectParentId();
        if(!StringUtils.isEmpty(subjectParentId) || !StringUtils.isEmpty(subjectId)) {
            // 需要根据这两个id, 去查询两条数据
            SubjectDto oneLevelSubject = eduFeignService.select(subjectParentId);
            SubjectDto twoLevelSubject = eduFeignService.select(subjectId);

            questionResultList.forEach(item -> {
                item.setSubjectParentTitle(oneLevelSubject.getTitle());
                item.setSubjectTitle(twoLevelSubject.getTitle());
            });

        }else {
            // 需要查询所有学科
            List<SubjectDto> subjectDtoList = eduFeignService.list();
            questionResultList.forEach(questionResult -> {
                subjectDtoList.forEach(subjectDto -> {
                    if(questionResult.getSubjectParentId().equals(subjectDto.getId())) {
                        questionResult.setSubjectParentTitle(subjectDto.getTitle());
                    }
                    if(questionResult.getSubjectId().equals(subjectDto.getId())) {
                        questionResult.setSubjectTitle(subjectDto.getTitle());
                    }
                });
            });
        }
        long total = page.getTotal();
        return R.ok().put("records", questionResultList).put("total", total);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public R edit(@RequestBody QuestionVo questionVo) {
        String type = questionVo.getQuestionType();
        switch (type) {
            case XliEduConstant.SINGLE_CHOICE :
                // 1. 如果是 1 , 就是选择题
                ChoiceQuestion choiceQuestion = new ChoiceQuestion();
                choiceQuestion.setQuestionType(XliEduConstant.SINGLE_CHOICE);
                BeanUtils.copyProperties(questionVo, choiceQuestion);
                choiceQuestionController.edit(choiceQuestion);
                break;
            case XliEduConstant.MULTI_CHOICE :
                // 2. 如果是 2 , 就是多选题
                ChoiceQuestion multiChoiceQuestion = new ChoiceQuestion();
                multiChoiceQuestion.setQuestionType(XliEduConstant.MULTI_CHOICE);
                BeanUtils.copyProperties(questionVo, multiChoiceQuestion);
                String[] rightKeyArray = questionVo.getRightKeyArray();
                if(rightKeyArray.length == 1) {
                    multiChoiceQuestion.setRightKey(rightKeyArray[0]);
                }else {
                    String res = LetterArraySortUtils.sort(rightKeyArray);
                    multiChoiceQuestion.setRightKey(res);
                }
                choiceQuestionController.edit(multiChoiceQuestion);
                break;
            case XliEduConstant.JUDGE_QUESTION :
                // 3. 如果是 3 , 就是判断题
                JudgeQuestion judgeQuestion = new JudgeQuestion();
                BeanUtils.copyProperties(questionVo, judgeQuestion);
                judgeQuestion.setQuestionType(XliEduConstant.JUDGE_QUESTION);
                judgeQuestionController.edit(judgeQuestion);
                break;
            case XliEduConstant.FILL_QUESTION :
                // 4. 如果是 4 , 就是填空题
                FillQuestion fillQuestion = new FillQuestion();
                BeanUtils.copyProperties(questionVo, fillQuestion);
                fillQuestion.setQuestionType(XliEduConstant.FILL_QUESTION);
                fillQuestionController.edit(fillQuestion);
                break;
            case XliEduConstant.SHORT_QUESTION :
                // 5. 如果是 5 , 就是简答题
                ShortAnswerQuestion shortAnswerQuestion = new ShortAnswerQuestion();
                BeanUtils.copyProperties(questionVo, shortAnswerQuestion);
                shortAnswerQuestion.setQuestionType(XliEduConstant.SHORT_QUESTION);
                shortAnswerQuestionController.edit(shortAnswerQuestion);
                break;
            default:
                throw new XliException(20001, "数据异常");
        }
        return R.ok();
    }

    @RequestMapping(value = "/select/{questionType}/{id}", method = RequestMethod.POST)
    public R select(@PathVariable("questionType") String questionType,
                    @PathVariable("id") Integer id) {
        // 校验数据
        if(StringUtils.isEmpty(questionType) || id == null) {
            throw new XliException(20001, "数据异常o(╥﹏╥)o");
        }

        QuestionVo questionVo = new QuestionVo();

        switch (questionType) {
            case XliEduConstant.SINGLE_CHOICE:
            case XliEduConstant.MULTI_CHOICE:
                ChoiceQuestion choiceQuestion = choiceQuestionController.select(questionType, id);
                BeanUtils.copyProperties(choiceQuestion, questionVo);
                break;
            case XliEduConstant.JUDGE_QUESTION:
                JudgeQuestion judgeQuestion = judgeQuestionController.select(id);
                BeanUtils.copyProperties(judgeQuestion, questionVo);
                break;
            case XliEduConstant.FILL_QUESTION:
                FillQuestion fillQuestion = fillQuestionController.select(id);
                BeanUtils.copyProperties(fillQuestion, questionVo);
                break;
            case XliEduConstant.SHORT_QUESTION:
                ShortAnswerQuestion shortAnswerQuestion = shortAnswerQuestionController.select(id);
                BeanUtils.copyProperties(shortAnswerQuestion, questionVo);
                break;
            default:
                throw new XliException(20001, "数据格式异常");
        }
        return R.ok().put("questionVo", questionVo);
    }

    @RequestMapping(value = "/delete/{questionType}/{id}", method = RequestMethod.POST)
    public R delete(@PathVariable("questionType") String questionType,
                    @PathVariable("id") Integer id) {
        // 校验数据
        if(StringUtils.isEmpty(questionType) || id == null) {
            throw new XliException(20001, "数据异常o(╥﹏╥)o");
        }
        switch (questionType) {
            case XliEduConstant.SINGLE_CHOICE:
            case XliEduConstant.MULTI_CHOICE:
                choiceQuestionController.delete(id, questionType);
                break;
            case XliEduConstant.JUDGE_QUESTION:
                judgeQuestionController.delete(id);
                break;
            case XliEduConstant.FILL_QUESTION:
                fillQuestionController.delete(id);
                break;
            case XliEduConstant.SHORT_QUESTION:
                shortAnswerQuestionController.delete(id);
                break;
            default:
                throw new XliException(2000, "数据格式异常");
        }
        return R.ok();
    }

}

