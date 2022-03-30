package com.hujiayi.auxiliaryteach.ems.vo;

import lombok.Data;

import java.util.Date;

/**
 * 用于page查询, 返回的数据
 */
@Data
public class QuestionResultVo {

    private String id;
    private String subjectId; // 用于查询所有
    private String subjectParentId; // 用于查询所有
    private String subjectTitle;
    private String subjectParentTitle;
    private String questionType;
    private String question;
    private Integer score;
    private Integer level;
    private Date gmtCreate;

}

