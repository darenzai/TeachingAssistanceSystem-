package com.hujiayi.auxiliaryteach.ems.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ExamQueryVo {

    private String title; // 考试名称
    private String courseId; // 课程id
    private String teacherId; // 出卷老师id
    private Date begin; // 开始时间
    private Date end; // 结束时间
}
