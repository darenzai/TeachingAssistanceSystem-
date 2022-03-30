package com.hujiayi.auxiliaryteach.ems.controller;


import com.hujiayi.auxiliaryteach.common.constans.XliEduConstant;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.ems.utils.LetterArraySortUtils;
import com.hujiayi.auxiliaryteach.ems.entity.Answer;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.entity.ScoreManage;
import com.hujiayi.auxiliaryteach.ems.service.AnswerService;
import com.hujiayi.auxiliaryteach.ems.service.ExamManageService;
import com.hujiayi.auxiliaryteach.ems.service.PaperManageService;
import com.hujiayi.auxiliaryteach.ems.service.ScoreManageService;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.AnswerVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.ExamAnalysisVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.QuestionAnalysisListVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.QuestionAnalysisVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
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
@RequestMapping("/ems/answer")
public class AnswerController {

    @Autowired
    private ExamManageService examManageService;

    @Autowired
    private PaperManageService paperManageService;

    @Autowired
    private ScoreManageController scoreManageController;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private PaperManageController paperManageController;

    @Autowired
    private ScoreManageService scoreManageService;

    // 1. 提交试卷, 插入答案
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public R edit(@RequestBody AnswerVo answerVo, HttpServletRequest request) {
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        if(jwtInfo == null) {
            throw new XliException(20001, "登录才能提交答案~");
        }
        String memberId = jwtInfo.getId();
        ExamManage examManage = examManageService.getById(answerVo.getId());

        QueryWrapper<Answer> answerWrapper = new QueryWrapper<>();
        answerWrapper.eq("member_id", memberId);
        answerWrapper.eq("paper_id", examManage.getPaperId());
        answerWrapper.orderByDesc("number");
        List<Answer> answerList = answerService.list(answerWrapper);

        // 1. 插入考试答案
        Integer paperId = examManage.getPaperId();
        QueryWrapper<PaperManage> twoWrapper = new QueryWrapper<>();
        twoWrapper.eq("parent_id", paperId);
        // 二级paper列表
        List<PaperManage> twoLevelPaperList = paperManageService.list(twoWrapper);
        twoLevelPaperList.forEach(item -> {
            QueryWrapper<PaperManage> threeWrapper = new QueryWrapper<>();
            threeWrapper.eq("parent_id", item.getId());
            List<PaperManage> threeLevelPaperList = paperManageService.list(threeWrapper);
            for(int i = 0; i < threeLevelPaperList.size(); i++) {
                PaperManage paperManage = threeLevelPaperList.get(i);
                R r = paperManageController.select(paperManage.getQuestionType(), paperManage.getQuestionId());
                QuestionVo questionVo = (QuestionVo)r.getData().get("questionVo");
                Answer answer = new Answer();
                answer.setPaperId(examManage.getPaperId());
                answer.setMemberId(memberId);
                answer.setQuestionId(questionVo.getId());
                answer.setQuestionType(questionVo.getQuestionType());
                if(answerList.size() > 0 && answerList != null) {
                    answer.setNumber(answerList.get(0).getNumber() + 1);
                }else {
                    answer.setNumber(1);
                }
                if(paperManage.getQuestionType().equals(XliEduConstant.SINGLE_CHOICE)) {
                    answer.setAnswer(answerVo.getRadio()[i]);
                    String[] radio = answerVo.getRadio();
                    if(questionVo.getRightKey().equals(radio[i])) {
                        answer.setScore(questionVo.getScore());
                    }else {
                        answer.setScore(XliEduConstant.SCORE);
                    }
                    // 插入数据
                    answerService.save(answer);
                }
                if(paperManage.getQuestionType().equals(XliEduConstant.MULTI_CHOICE)) {
                    String[][] multi = answerVo.getMulti();
                    String[] str = multi[i];
                    String res = LetterArraySortUtils.sort(str);
                    answer.setAnswer(res);
                    if(questionVo.getRightKey().equals(res)) {
                        answer.setScore(questionVo.getScore());
                    }else {
                        answer.setScore(XliEduConstant.SCORE);
                    }
                    // 插入数据
                    answerService.save(answer);
                }
                if(paperManage.getQuestionType().equals(XliEduConstant.JUDGE_QUESTION)) {
                    answer.setAnswer(answerVo.getJudgeAnswer()[i]);
                    if(questionVo.getAnswer().equals(answerVo.getJudgeAnswer()[i])) {
                        answer.setScore(questionVo.getScore());
                    }else {
                        answer.setScore(XliEduConstant.SCORE);
                    }
                    // 插入数据
                    answerService.save(answer);
                }
                if(paperManage.getQuestionType().equals(XliEduConstant.FILL_QUESTION)) {
                    answer.setAnswer(answerVo.getFillAnswer()[i]);
                    if(questionVo.getAnswer().equals(answerVo.getFillAnswer()[i])) {
                        answer.setScore(questionVo.getScore());
                    }else {
                        answer.setScore(XliEduConstant.SCORE);
                    }
                    // 插入数据
                    answerService.save(answer);
                }
                if(paperManage.getQuestionType().equals(XliEduConstant.SHORT_QUESTION)) {
                    answer.setAnswer(answerVo.getShortContent()[i]);
                    if(questionVo.getAnswer().equals(answerVo.getShortContent()[i])) {
                        answer.setScore(questionVo.getScore());
                    }else {
                        answer.setScore(XliEduConstant.SCORE);
                    }
                    // 插入数据
                    answerService.save(answer);
                }
            }
        });

        // 2. 插入考试信息和设置得分
        ScoreManage scoreManage =  scoreManageController.edit(examManage, memberId);
        return R.ok().put("scoreManage", scoreManage);
    }

    // 根据试卷Id, 查看解析
    @RequestMapping(value = "/select/{examId}/{number}", method = RequestMethod.POST)
    public R select(@PathVariable("examId") String examId,
                    @PathVariable("number") Integer number,
                    HttpServletRequest request) {
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        if(jwtInfo == null) {
            throw new XliException(20001, "登录才能提交答案~");
        }
        String memberId = jwtInfo.getId();

        ExamAnalysisVo examAnalysisVo = new ExamAnalysisVo();
        // 1. 查询考试信息
        ExamManage examManage = examManageService.getById(examId);
        examAnalysisVo.setTitle(examManage.getTitle());
        examAnalysisVo.setTotalScore(examManage.getTotalScore());
        examAnalysisVo.setId(examManage.getId());

        // 2. 查询考试的成绩信息
        QueryWrapper<ScoreManage> scoreManagerWrapper = new QueryWrapper<>();
        scoreManagerWrapper.eq("member_id", memberId);
        scoreManagerWrapper.eq("exam_id", examId);
        scoreManagerWrapper.eq("number", number);
        ScoreManage scoreManage = scoreManageService.getOne(scoreManagerWrapper);
        examAnalysisVo.setExamScore(scoreManage.getExamScore());
        examAnalysisVo.setGmtCreate(scoreManage.getGmtCreate());

        // 3. 设置题目列表信息。
        Integer paperId = examManage.getPaperId();
        QueryWrapper<PaperManage> twoLevelPaperWrapper = new QueryWrapper<>();
        twoLevelPaperWrapper.eq("parent_id", paperId);
        // 二级列表
        List<PaperManage> twoPaperList = paperManageService.list(twoLevelPaperWrapper);
        ArrayList<QuestionAnalysisListVo> questionAnalysisListVos = new ArrayList<>();

        twoPaperList.forEach(item -> {
            QuestionAnalysisListVo questionAnalysisListVo = new QuestionAnalysisListVo();
            questionAnalysisListVo.setName(item.getName());
            QueryWrapper<PaperManage> threeLevelPaperWrapper = new QueryWrapper<>();
            threeLevelPaperWrapper.eq("parent_id", item.getId());
            // 三级列表
            List<PaperManage> threePaperList = paperManageService.list(threeLevelPaperWrapper);
            ArrayList<QuestionAnalysisVo> questionAnalysisVos = new ArrayList<>();
            threePaperList.forEach(question -> {
                R r = paperManageController.select(question.getQuestionType(), question.getQuestionId());
                QuestionVo questionVo = (QuestionVo)r.getData().get("questionVo");
                QuestionAnalysisVo questionAnalysisVo = new QuestionAnalysisVo();
                BeanUtils.copyProperties(questionVo, questionAnalysisVo);

                QueryWrapper<Answer> answerWrapper = new QueryWrapper<>();
                answerWrapper.eq("member_id", memberId);
                answerWrapper.eq("number", number);
                answerWrapper.eq("paper_id", examManage.getPaperId());
                answerWrapper.eq("question_id", question.getQuestionId());
                answerWrapper.eq("question_type", question.getQuestionType());

                Answer answer = answerService.getOne(answerWrapper);
                // 设置多选题答案
                if(question.getQuestionType().equals(XliEduConstant.MULTI_CHOICE)) {
                    questionAnalysisVo.setRightArray(LetterArraySortUtils.reverseStr(answer.getAnswer()));
                }
                questionAnalysisVo.setUserAnswer(answer.getAnswer());
                questionAnalysisVo.setUserScore(answer.getScore());

                questionAnalysisVos.add(questionAnalysisVo);
            });
            questionAnalysisListVo.setQuestionItems(questionAnalysisVos);
            questionAnalysisListVos.add(questionAnalysisListVo);
        });
        examAnalysisVo.setTitleItems(questionAnalysisListVos);
        return R.ok().put("examAnalysisVo", examAnalysisVo);
    }

}
