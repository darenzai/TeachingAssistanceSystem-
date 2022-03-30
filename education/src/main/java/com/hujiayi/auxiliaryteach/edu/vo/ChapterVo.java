package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 章节
 */
@Data
public class ChapterVo {

    private String id;

    private String title;

    private Integer sort;

    private List<VideoSectionVo> children = new ArrayList<>();


}
