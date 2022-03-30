package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

@Data
public class AnswerVo {

    private String id; // 考试的ID
    private String[] radio; // 单选题数组
    private String[][] multi; // 二维数组多选题
    private String[] judgeAnswer; // 判断题
    private String[] fillAnswer; // 填空题
    private String[] shortContent; // 简答题

}
