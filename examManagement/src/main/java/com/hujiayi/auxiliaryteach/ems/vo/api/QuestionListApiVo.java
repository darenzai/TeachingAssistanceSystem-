package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.List;

@Data
public class QuestionListApiVo {

    private String type; // 类型 单选题为1 多2 判3 填4 简5

    private String name; // 标题名称

    private List<QuestionApiVo> questionItems; // 题目列表

}
