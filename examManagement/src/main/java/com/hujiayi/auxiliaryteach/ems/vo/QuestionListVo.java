package com.hujiayi.auxiliaryteach.ems.vo;

import lombok.Data;

import java.util.List;

@Data
public class QuestionListVo {

    private String name; // 标题名称

    private List<QuestionVo> questionItems;

}
