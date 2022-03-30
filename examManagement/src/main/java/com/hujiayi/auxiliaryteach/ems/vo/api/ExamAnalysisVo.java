package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 考试解析 vo
 */
@Data
public class ExamAnalysisVo {

    private String id; // 考试id
    private String title; // 考试名称
    private Integer totalScore; // 考试总分

    private Integer examScore; // 考试得分
    private Date gmtCreate; // 提交时间
    private List<QuestionAnalysisListVo> titleItems; // 二级列表
}
