package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

/**
 * 小节（课时，视频部分）
 */
@Data
public class VideoSectionVo {

    private String id;

    private String title;

    private Boolean free;

    private Integer sort;

    private String videoSourceId;

}
