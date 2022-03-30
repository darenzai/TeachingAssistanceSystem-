package com.hujiayi.auxiliaryteach.ems.controller.api;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.entity.ScoreManage;
import com.hujiayi.auxiliaryteach.ems.service.ExamManageService;
import com.hujiayi.auxiliaryteach.ems.service.ScoreManageService;
import com.hujiayi.auxiliaryteach.ems.service.feign.EduFeignService;
import com.hujiayi.auxiliaryteach.ems.vo.api.ExamApiVo;
import com.hujiayi.auxiliaryteach.ems.vo.api.ScoreManageVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/ems/exam/api")
public class ExamManageApiController {

    @Autowired
    private ExamManageService examManageService;

    @Autowired
    private EduFeignService eduFeignService;

    @Autowired
    private ScoreManageService scoreManageService;

    // 1. 根据课程id以及type进行查询考试的信息
    @RequestMapping(value = "/select/{courseId}/{type}", method = RequestMethod.POST)
    public R select(@PathVariable String courseId,
                    @PathVariable Integer type,
                    HttpServletRequest request) {
        // 1. 拿到用户信息
        JwtInfo memberIdByJwtToken = JwtUtils.getMemberIdByJwtToken(request);

        QueryWrapper<ExamManage> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        if(type == 1) { // 查询单元测试
            wrapper.ne("chapter_id", 0);
            List<ExamManage> examList = examManageService.list(wrapper);
            List<ExamApiVo> examVoList = examList.stream().map(item -> {
                ExamApiVo examApiVo = new ExamApiVo();
                if(memberIdByJwtToken != null && memberIdByJwtToken.getId() != null) {
                    QueryWrapper<ScoreManage> scoreManageQueryWrapper = new QueryWrapper<>();
                    scoreManageQueryWrapper.eq("member_id", memberIdByJwtToken.getId());
                    scoreManageQueryWrapper.eq("exam_id", item.getId());
                    List<ScoreManage> scoreManageList = scoreManageService.list(scoreManageQueryWrapper);
                        if(scoreManageList.size() > 0 && scoreManageList != null) {
                            List<ScoreManageVo> scoreManages = new ArrayList<>();
                            Integer maxScore = 0;
                            for (ScoreManage manage : scoreManageList) {
                                ScoreManageVo scoreManageVo = new ScoreManageVo();
                                scoreManageVo.setGmtCreate(manage.getGmtCreate());
                                scoreManageVo.setNumber(manage.getNumber());
                                scoreManageVo.setExamScore(manage.getExamScore());
                                scoreManages.add(scoreManageVo);
                                if (manage.getExamScore() > maxScore) {
                                    maxScore = manage.getExamScore();
                                }
                            }
                            examApiVo.setMaxScore(maxScore);
                            ScoreManage scoreManage = scoreManageList.get(scoreManageList.size() - 1);
                            examApiVo.setNumber(scoreManage.getNumber());
                            examApiVo.setScoreManageList(scoreManages);
                        }else {
                            examApiVo.setNumber(0);
                            examApiVo.setMaxScore(0);
                        }
                }
                BeanUtils.copyProperties(item, examApiVo);
                examApiVo.setChapterName(eduFeignService.selectChapter(item.getChapterId()).getTitle());
                return examApiVo;
            }).collect(Collectors.toList());
            return R.ok().put("examList", examVoList);
        }else { // 查询考试
            wrapper.eq("chapter_id", 0);
            List<ExamManage> examList = examManageService.list(wrapper);
            List<ExamApiVo> examVoList = examList.stream().map(item -> {
                ExamApiVo examApiVo = new ExamApiVo();
                if(memberIdByJwtToken != null && memberIdByJwtToken.getId() != null) {
                    QueryWrapper<ScoreManage> scoreManageQueryWrapper = new QueryWrapper<>();
                    scoreManageQueryWrapper.eq("member_id", memberIdByJwtToken.getId());
                    scoreManageQueryWrapper.eq("exam_id", item.getId());
                    ScoreManage scoreManage = scoreManageService.getOne(scoreManageQueryWrapper);
                    if(scoreManage == null) {
                        examApiVo.setNumber(0);
                        examApiVo.setMaxScore(0);
                    }else {
                        examApiVo.setMaxScore(scoreManage.getExamScore());
                        examApiVo.setNumber(scoreManage.getNumber());
                    }
                }
                BeanUtils.copyProperties(item, examApiVo);
                return examApiVo;
            }).collect(Collectors.toList());
            return R.ok().put("examList", examVoList);
        }
    }

    // 2. 根据考试的id查询课程id
    @RequestMapping(value = "/select/{examId}", method = RequestMethod.POST)
    public R getById(@PathVariable("examId") String examId) {
        ExamManage examManage = examManageService.getById(examId);
        String courseId = examManage.getCourseId();
        return R.ok().put("courseId", courseId);
    }
}
