package com.hujiayi.auxiliaryteach.ems.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ExamVo {

    private String id; // 试卷id
    private String teacherId; // 讲师id
    private Integer type; // 试卷类型
    private String courseId; // 课程id
    private String chapterId; // 章节id
    private String title; // 考试名称
    private Integer totalScore; // 试卷总分
    private Integer totalTime; // 试卷时长
    private Date stopTime; // 试卷截止时间
    private List<QuestionListVo> titleItems;

}
