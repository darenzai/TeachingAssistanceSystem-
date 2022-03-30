package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * 课程发布vo, 用于查询课程信息
 */
@Data
public class CoursePublishVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    private String title;
    private String cover;
    private Integer lessonNum;
    private String subjectParentTitle;
    private String subjectTitle;
    private String teacherName;
    private String price;
}
