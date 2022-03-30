package com.hujiayi.auxiliaryteach.edu.service.feign;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.feign.fallback.VodFeignServiceFallBack;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Service
@FeignClient(value = "xueliedu-third-party", fallback = VodFeignServiceFallBack.class)
public interface VodFeignService {

    @DeleteMapping("/thirdparty/vod/delete/video/{id}")
    public R deleteVideById(@PathVariable("id") String id);

    // 3. 批量删除视频, 多个id
    @DeleteMapping("/thirdparty/vod/delete/videos")
    public R deleteVideoByIds(@RequestBody List<String> ids);

}

