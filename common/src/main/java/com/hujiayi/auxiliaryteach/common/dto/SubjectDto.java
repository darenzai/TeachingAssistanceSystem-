package com.hujiayi.auxiliaryteach.common.dto;

import lombok.Data;

/**
 * 用于题库模块获取题库列表
 */
@Data
public class SubjectDto {

    private String id;

    private String parentId;

    private String title;

}
