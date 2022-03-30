package com.hujiayi.auxiliaryteach.thirdparty.controller;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.thirdparty.service.OssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/thirdparty/oss")
public class OssController {

    @Autowired
    private OssService ossService;

    /**
     * 通过文件流的方式上传文件, 返回文件在OSS对象存储中的地址
     */
    @PostMapping("/get/url")
    public R getOssUrlByUploadFile(MultipartFile file) {
        String url = ossService.getOssUrlByUploadFile(file);
        return R.ok().message("文件上传成功") .put("url", url);
    }

}
