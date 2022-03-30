package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

@Data
public class QuestionAnalysisVo {

    private String questionType; // 题目类型, 1为单选, 2为多选, 3为判断, 4为填空, 5为简答题
    private String question; // 问题题干

    private String answerA; // 问题选项 A
    private String answerB; // 问题选项 B
    private String answerC; // 问题选项 C
    private String answerD; // 问题选项 D

    private String rightKey; // 正确答案(单选题, 多选题)
    private String answer; // 正确答案(判断, 填空, 简答)

    private String[] rightArray; // 多选题正确答案

    private String userAnswer; // 用户正确答案(判断, 填空, 简答)
    private Integer userScore; // 用户得分

    private Integer score; // 分数
    private String analysis; // 解析
    private Integer level; // 难度级别

}
