package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

/**
 * 课程查询条件Vo
 */
@Data
public class CourseQueryVo {


    private String title;

    private String teacherId;

    private String subjectId;

    private String subjectParentId;

}
