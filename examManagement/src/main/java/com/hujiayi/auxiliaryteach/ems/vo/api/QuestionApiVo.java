package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

@Data
public class QuestionApiVo {

    private Integer id; // 题目的id
    private String questionType; // 题目类型, 1为单选, 2为多选, 3为判断, 4为填空, 5为简答题
    private String question; // 问题题干

    private String answerA; // 问题选项 A
    private String answerB; // 问题选项 B
    private String answerC; // 问题选项 C
    private String answerD; // 问题选项 D

    private Integer score; // 分数
}
