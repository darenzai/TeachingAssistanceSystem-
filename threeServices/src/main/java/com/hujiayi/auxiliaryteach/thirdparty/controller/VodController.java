package com.hujiayi.auxiliaryteach.thirdparty.controller;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.thirdparty.service.VodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * 视频上传接口
 */
@RestController
@RequestMapping("/thirdparty/vod")
public class VodController {

    @Autowired
    private VodService vodService;

    // 1. 视频上传
    @PostMapping("/update/file")
    public R updateVodFile(MultipartFile file) {
        try {
            // 1. 获取文件输入流
            InputStream inputStream = file.getInputStream();
            // 2. 获取文件名称
            String filename = file.getOriginalFilename();
            // 3. 调用service方法, 实现业务, 返回视频videoId
            String videoId = vodService.updateVideoFile(inputStream, filename);
            return R.ok().put("videoId", videoId);
        } catch (IOException e) {
            e.printStackTrace();
            throw new XliException(20001, "视频上传失败 o(╥﹏╥)o");
        }
    }

    // 2. 根据视频的id删除视频
    @DeleteMapping("/delete/video/{id}")
    public R deleteVideById(@PathVariable("id") String id) {
        try {
            vodService.deleteVideById(id);
            return R.ok().message("视频删除成功");
        } catch (Exception e) {
            throw new XliException(20001, "删除视频异常o(╥﹏╥)o");
        }
    }

    // 3. 批量删除视频, 多个id
    @DeleteMapping("/delete/videos")
    public R deleteVideoByIds(@RequestBody List<String> ids) {
        try {
            vodService.deleteVideoByIds(ids);
            return R.ok();
        } catch (Exception e) {
            throw new XliException(20001, "删除视频异常");
        }
    }

    // 4. 根据视频播放的id, 获取播放凭证
    @GetMapping("/get/play/auth/{videoSourceId}")
    public R getPlayAuth(@PathVariable String videoSourceId) {
        try{
            String playAuth = vodService.getPlayAuth(videoSourceId);
            return R.ok().put("playAuth", playAuth);
        } catch (Exception e) {
            throw new XliException(20001, "视频播放凭证获取异常 o(╥﹏╥)o");
        }
    }
}
