package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.List;

/**
 * 考试内容
 */
@Data
public class ExamContentApiVo {

    private String examId; // 考试Id
    private String title; // 考试名称
    private Integer totalScore; // 考试总分
    private Integer totalTime; // 考试有效时间
    private List<QuestionListApiVo> titleItems; // 题目集合

}
