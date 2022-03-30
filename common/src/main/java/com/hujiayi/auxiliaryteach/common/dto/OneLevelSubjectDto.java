package com.hujiayi.auxiliaryteach.common.dto;

import lombok.Data;

import java.util.List;

@Data
public class OneLevelSubjectDto {

    private String id;

    private String title;

    private String parentId;

    private List<TwoLevelSubjectDto> children;

}
