package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Banner;
import com.hujiayi.auxiliaryteach.edu.service.BannerService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 首页banner表 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/banner")
public class BannerController {

    @Autowired
    private BannerService bannerService;

    // 1. 获取所有Banner列表
    @GetMapping("/get/banners")
    public R getBannerList() {
        List<Banner> list = bannerService.list();
        return R.ok().put("items", list);
    }

    // 2. 新增banner
    @PostMapping("/add/banner")
    public R addBanner(@RequestBody Banner banner) {
        bannerService.save(banner);
        return R.ok();
    }

    // 3. 修改banner根据id
    @PutMapping("/update/banner")
    public R updateBanner(@RequestBody Banner banner) {
        bannerService.updateById(banner);
        return R.ok();
    }

    // 4. 根据id查询banner
    @GetMapping("/get/banner/{id}")
    public R getBannerById(@PathVariable("id") String id) {
        Banner banner = bannerService.getById(id);
        return R.ok().put("banner", banner);
    }

    // 5. 删除banner根据id
    @DeleteMapping("/delete/banner/{id}")
    public R deleteBanner(@PathVariable("id") String id) {
        // TODO 删除在OSS对象存储的图片

        bannerService.removeById(id);
        return R.ok();
    }

    // 6. banner分页列表
    @GetMapping("/list/banner/page/{current}/{size}")
    public R pageBannerList(@PathVariable("current") Long current,
                            @PathVariable("size") Long size) {
        QueryWrapper<Banner> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        Page<Banner> page = new Page<>(current, size);
        IPage<Banner> bannerPage = bannerService.page(page, wrapper);
        List<Banner> records = bannerPage.getRecords();
        long total = bannerPage.getTotal();
        return R.ok().put("records", records).put("total", total);
    }

}
