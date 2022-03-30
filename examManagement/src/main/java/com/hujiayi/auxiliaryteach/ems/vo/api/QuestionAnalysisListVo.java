package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.List;

@Data
public class QuestionAnalysisListVo {

    private String name; // 题目名称

    private List<QuestionAnalysisVo> questionItems; // 三级列表

}
