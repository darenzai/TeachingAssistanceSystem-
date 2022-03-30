package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

import java.util.List;

@Data
public class OneLevelSubjectVo {

    private String id;

    private String title;

    private String parentId;

    private List<TwoLevelSubjectVo> childs;

}
