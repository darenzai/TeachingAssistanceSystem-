package com.hujiayi.auxiliaryteach.thirdparty.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.hujiayi.auxiliaryteach.thirdparty.service.OssService;
import com.hujiayi.auxiliaryteach.thirdparty.utils.ConstantPropertyUtils;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {

    @Override
    public String getOssUrlByUploadFile(MultipartFile file) {

        // 获取阿里云相关常量
        String endpoint = ConstantPropertyUtils.END_POINT;
        String accessKeyId = ConstantPropertyUtils.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertyUtils.ACCESS_KEY_SECRET;
        String bucketName = ConstantPropertyUtils.BUCKET_NAME;

        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        InputStream inputStream = null;
        try {
            // 1. 获取文件的输入流
            inputStream = file.getInputStream();
            // 2. 获取文件原名称
            String fileName = file.getOriginalFilename();
            // 3. 给文件的名加上一个随机数, 目的是为了 文件名称相同, 而产生了覆盖
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            // 4. 生成时间, 如 2020/7/21日, 可以把/当成一个目录的路径
            String date = new DateTime().toString("yyyy/MM/dd");
            // 5. 拼接文件名称
            fileName = date + "/" + uuid + fileName;
            // 6. 以文件流的形式上传
            ossClient.putObject(bucketName, fileName, inputStream);
            // 7. 关闭客户端
            ossClient.shutdown();
            // 8. 拼接图片地址返回。
            String url = "https://" + bucketName + "." + endpoint + "/" + fileName;
            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
