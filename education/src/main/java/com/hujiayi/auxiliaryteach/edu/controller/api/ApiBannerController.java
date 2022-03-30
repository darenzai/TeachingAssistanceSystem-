package com.hujiayi.auxiliaryteach.edu.controller.api;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Banner;
import com.hujiayi.auxiliaryteach.edu.service.BannerService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/edu/front/banner")
public class ApiBannerController {

    @Autowired
    private BannerService bannerService;

    // 获取最新的轮播图
    @Cacheable(value = "index", key = "'getBannerList'")
    @GetMapping("/get/banners")
    public com.hujiayi.auxiliaryteach.common.result.R getBannerList() {
        QueryWrapper<Banner> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        wrapper.last("limit 5");
        List<Banner> bannerList = bannerService.list(wrapper);
        return R.ok().put("bannerList", bannerList);
    }

}
