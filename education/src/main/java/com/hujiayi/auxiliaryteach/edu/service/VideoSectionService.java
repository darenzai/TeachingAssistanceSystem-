package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.VideoSection;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程小节视频 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface VideoSectionService extends IService<VideoSection> {

    void deleteVideoById(String id);
}
