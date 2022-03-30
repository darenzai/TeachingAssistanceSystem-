package com.hujiayi.auxiliaryteach.thirdparty.service.impl;


import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.thirdparty.service.VodService;
import com.hujiayi.auxiliaryteach.thirdparty.utils.AliyunVodSDKUtils;
import com.hujiayi.auxiliaryteach.thirdparty.utils.ConstantPropertyUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.InputStream;
import java.util.List;

@Service
public class VodServiceImpl implements VodService {

    /**
     * 实现视频上传业务
     */
    @Override
    public String updateVideoFile(InputStream inputStream, String filename) {

        // 1. 截取文件名称, 去掉.后缀后面的格式名称
        String title = filename.substring(0, filename.lastIndexOf("."));
        // 2. 创建一个request
        // (String accessKeyId, String accessKeySecret, String title, String fileName, InputStream inputStream) {
        UploadStreamRequest request = new UploadStreamRequest(ConstantPropertyUtils.ACCESS_KEY_ID,
                ConstantPropertyUtils.ACCESS_KEY_SECRET, title, filename, inputStream);
        // 3. 创建上传对象
        UploadVideoImpl uploadVideo = new UploadVideoImpl();
        // 4. 拿到上传文件的响应
        UploadStreamResponse response = uploadVideo.uploadStream(request);
        // 5. 通过响应拿到上传视频的id
        String videoId = response.getVideoId();

        if(StringUtils.isEmpty(videoId)) {
            throw new XliException(20001, "视频上传异常 o(╥﹏╥)o");
        }

        return videoId;
    }

    // 根据id删除视频
    @Override
    public void deleteVideById(String id) {
        try {
            // 1. 获取客户端
            DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(ConstantPropertyUtils.ACCESS_KEY_ID,
                    ConstantPropertyUtils.ACCESS_KEY_SECRET);
            // 2. 获取request
            DeleteVideoRequest request = new DeleteVideoRequest();
            // 3. 通过request进行删除该视频
            request.setVideoIds(id);
            // 4. 通过客户端, 传入request参数, 进行删除
            client.getAcsResponse(request);
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

    // 3. 批量删除视频, 多个id
    @Override
    public void deleteVideoByIds(List<String> ids) throws ClientException {

        // 1. 初始化client对象
        DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(ConstantPropertyUtils.ACCESS_KEY_ID,
                ConstantPropertyUtils.ACCESS_KEY_SECRET);
        // 2. 创建删除的request
        DeleteVideoRequest request = new DeleteVideoRequest();
        // 3. 获取ids的长度
        int size = ids.size();
        System.out.println("size:" + size);
        // 4. 定义一个StringBuffer
        StringBuffer idsList = new StringBuffer();
        // 5. 传输size最大值, 如果size大小超过了20, 则默认使用20, 否则就使用原来size大小
        for(int i = 0; i < size; i++) {
            // 每次遍历追加到idsList中
            idsList.append(ids.get(i));
            if (i == size - 1 || i % 20 == 19 ) {
                // 通过控制台打印可以打印, 查看封装的ids
                System.out.println("idsList:" + idsList.toString());
                // 设置要删除的ids
                request.setVideoIds(idsList.toString());
                client.getAcsResponse(request);
                // 置空, 清楚数据
                idsList = new StringBuffer();
            }else{
                idsList.append(",");
            }
        }

    }

    // 获取视频播放凭证
    @Override
    public String getPlayAuth(String videoSourceId) throws ClientException {
        // 1. 初始化client对象
        DefaultAcsClient client = AliyunVodSDKUtils.initVodClient(ConstantPropertyUtils.ACCESS_KEY_ID,
                ConstantPropertyUtils.ACCESS_KEY_SECRET);
        // 2. 初始化request对象
        GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
        // 3. 设置视频的id
        request.setVideoId(videoSourceId);
        // 4. 通过client请求, 获得响应
        GetVideoPlayAuthResponse response = client.getAcsResponse(request);
        // 5. 获取凭证返回
        return response.getPlayAuth();
    }

}















