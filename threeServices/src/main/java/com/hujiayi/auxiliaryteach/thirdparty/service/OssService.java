package com.hujiayi.auxiliaryteach.thirdparty.service;

import org.springframework.web.multipart.MultipartFile;

public interface OssService {

    String getOssUrlByUploadFile(MultipartFile file);

}
