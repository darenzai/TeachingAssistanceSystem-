package com.hujiayi.auxiliaryteach.thirdparty.service;

import com.aliyuncs.exceptions.ClientException;

import java.io.InputStream;
import java.util.List;

public interface VodService {

    String updateVideoFile(InputStream inputStream, String filename);

    void deleteVideById(String id);

    void deleteVideoByIds(List<String> ids) throws ClientException;

    String getPlayAuth(String videoSourceId) throws ClientException;
}
