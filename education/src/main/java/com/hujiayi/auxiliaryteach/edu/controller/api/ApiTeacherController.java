package com.hujiayi.auxiliaryteach.edu.controller.api;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Teacher;
import com.hujiayi.auxiliaryteach.edu.service.TeacherService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 前端网站, 访问服务端讲师的接口
 */
@RestController
@RequestMapping("/edu/front/teacher")
public class ApiTeacherController {

    @Autowired
    private TeacherService teacherService;

    // 1. 获取讲师列表
    @GetMapping("/get/teacher/list/{current}/{size}")
    public R getTeacherList(@PathVariable Long current,
                            @PathVariable Long size) {
        Page<Teacher> teacherPage = new Page<>(current, size);
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        IPage<Teacher> page = teacherService.page(teacherPage, wrapper);
        long total = page.getTotal();
        List<Teacher> teacherList = page.getRecords();
        return R.ok().put("teacherList", teacherList).put("total", total);
    }

    // 2. 根据讲师id获取讲师详情页数据
    @GetMapping("/get/teacher/{id}")
    public R getTeacherInfoById(@PathVariable("id") String id) {
        Map<String, Object> map = teacherService.getTeacherInfoById(id);
        return R.ok().put(map);
    }

}
