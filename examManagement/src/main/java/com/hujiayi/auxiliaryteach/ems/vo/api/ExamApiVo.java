package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ExamApiVo {

    private String id; // 考试id
    private String title; // 考试的标题
    private Integer totalScore; // 总分
    private Integer totalTime; // 时长
    private String chapterName; // 章节的名称
    private Date stopTime; // 截止时间
    private Integer paperId; // 试卷id

    private Integer maxScore; // 最高得分
    private Integer number; // 测试或考试有效次数
    private List<ScoreManageVo> scoreManageList;

}
