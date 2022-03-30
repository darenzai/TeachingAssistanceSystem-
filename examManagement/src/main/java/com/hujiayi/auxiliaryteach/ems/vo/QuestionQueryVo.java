package com.hujiayi.auxiliaryteach.ems.vo;

import lombok.Data;

/**
 * 查询条件的VO
 */
@Data
public class QuestionQueryVo {

    private Integer id;
    private String subjectId;
    private String subjectParentId;
    private String questionType;
}
