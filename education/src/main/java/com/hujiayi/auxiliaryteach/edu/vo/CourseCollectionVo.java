package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 课程收藏VO
 */
@Data
public class CourseCollectionVo {

    private String id;
    private String courseId; // 课程id
    private String title; // 标题
    private BigDecimal price; // 价格
    private Integer lessonNum; // 课时数
    private String cover; //封面
    private String teacherName; // 讲师
    private String gmtCreate; // 收藏时间

}
