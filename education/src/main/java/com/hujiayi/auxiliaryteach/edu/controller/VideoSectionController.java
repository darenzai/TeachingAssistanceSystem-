package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.VideoSection;
import com.hujiayi.auxiliaryteach.edu.service.VideoSectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 课程小节视频 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/video")
public class VideoSectionController {

    @Autowired
    private VideoSectionService videoSectionService;


    // 1. 新增课时
    @PostMapping("/add/video/section")
    public R addVideoSection(@RequestBody VideoSection videoSection) {
        videoSectionService.save(videoSection);
        return R.ok();
    }

    // 2. 根据id查询课时
    @GetMapping("/get/video/section/{id}")
    public R getVideoSectionById(@PathVariable("id") String id) {
        VideoSection videoSection = videoSectionService.getById(id);
        return R.ok().put("videoSection", videoSection);
    }

    // 3. 使用id更新课时
    @PutMapping("/update/video/section")
    public R updateVideoSectionById(@RequestBody VideoSection videoSection) {
        videoSectionService.updateById(videoSection);
        return R.ok();
    }

    // 4. 根据id删除课时
    @DeleteMapping("/delete/video/section/{id}")
    public R deleteVideoSectionById(@PathVariable("id") String id) {
        // 删除视频
        videoSectionService.deleteVideoById(id);
        // 删除课时
        videoSectionService.removeById(id);
        return R.ok();
    }

}

