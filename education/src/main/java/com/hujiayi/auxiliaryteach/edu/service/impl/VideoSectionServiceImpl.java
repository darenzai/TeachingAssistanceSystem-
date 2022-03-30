package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.hujiayi.auxiliaryteach.edu.entity.VideoSection;
import com.hujiayi.auxiliaryteach.edu.mapper.VideoSectionMapper;
import com.hujiayi.auxiliaryteach.edu.service.VideoSectionService;
import com.hujiayi.auxiliaryteach.edu.service.feign.VodFeignService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程小节视频 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
@Slf4j
public class VideoSectionServiceImpl extends ServiceImpl<VideoSectionMapper, VideoSection> implements VideoSectionService {

    @Autowired(required = false)
    private VodFeignService vodFeignService;

    // 1. 删除视频
    @Override
    public void deleteVideoById(String id) {
        // 1. 根据视频小节id查询出该课时信息
        VideoSection videoSection = this.getById(id);
        log.info("videoSection:" + videoSection);
        // 2. 拿到该课时视频的播放id
        String videoSourceId = videoSection.getVideoSourceId();
        if(StringUtils.isEmpty(videoSourceId)) {
            return ;
        }
        log.info("videoSourceId:" + videoSourceId);
        // 3. 通过feign远程调用删除
        vodFeignService.deleteVideById(videoSourceId);
    }
}
