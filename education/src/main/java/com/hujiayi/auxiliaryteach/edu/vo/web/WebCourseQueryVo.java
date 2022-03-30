package com.hujiayi.auxiliaryteach.edu.vo.web;

import lombok.Data;

import java.io.Serializable;

/**
 * 定义vo
 */
@Data
public class WebCourseQueryVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String subjectParentId;
    private String subjectId;
    private String buyCountSort;
    private String gmtCreateSort;
    private String priceSort;
    private Integer type; // 价格正序为1, 倒序为2
}
