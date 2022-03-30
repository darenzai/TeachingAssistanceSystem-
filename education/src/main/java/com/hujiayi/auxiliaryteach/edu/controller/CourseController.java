package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.service.CourseService;
import com.hujiayi.auxiliaryteach.edu.vo.CourseInfoVo;
import com.hujiayi.auxiliaryteach.edu.vo.CoursePublishVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    // 保存课程信息, 返回课程的id
    @PostMapping("/save/course/info")
    public R saveCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        String courseId = courseService.saveCourseInfo(courseInfoVo);
        return R.ok().put("courseId", courseId);
    }

    // 更新课程
    @PutMapping("/update/course/info")
    public R updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo) {
        courseService.updateCourseInfo(courseInfoVo);
        return R.ok();
    }

    // 根据课程id查询课程
    @GetMapping("/get/course/{id}")
    public R getCourseById(@PathVariable("id") String id) {
        CourseInfoVo courseInfoVo = courseService.getCourseById(id);
        return R.ok().put("courseInfoVo", courseInfoVo);
    }

    // 分页条件查询课程信息, 完善课程列表信息
    @PostMapping("/list/course/{current}/{size}")
    public R getCourseListByCondition(@RequestBody CourseQueryVo courseQueryVo,
                                      @PathVariable("current") Long current,
                                      @PathVariable("size") Long size) {
        System.out.println(courseQueryVo);
        IPage<CourseVo> pages = courseService.getCourseListByCondition(courseQueryVo, current, size);
        List<CourseVo> records = pages.getRecords();
        long total = pages.getTotal();
        return R.ok().put("courseList", records).put("total", total);
    }

    // 根据课程id删除课程
    @DeleteMapping("/delete/course/{id}")
    public R deleteCourseById(@PathVariable("id") String id) {
        // 删除课程下所有章节和章节下小节视频根据课程id
        courseService.deleteChapterAndVideoByCourseId(id);
        courseService.removeById(id);
        return R.ok();
    }

    // 根据课程id查询, 发布课程的信息
    @GetMapping("/get/course/publish/info/{id}")
    public R getCoursePublishInfoById(@PathVariable("id") String id) {
        CoursePublishVo coursePublishInfo = courseService.getCoursePublishInfoById(id);
        if(coursePublishInfo == null) {
            throw new XliException(20001, "课程信息获取异常 o(╥﹏╥)o");
        }
        return R.ok().put("coursePublishInfo", coursePublishInfo);
    }

    // 发布课程
    @PutMapping("/update/publish/course/{id}")
    public R publishCourseById(@PathVariable("id") String id) {
        courseService.publishCourseById(id);
        return R.ok();
    }

    // 获取课程列表
    @GetMapping("/get/course/list")
    public R getCourseList() {
        List<Course> list = courseService.list();
        return R.ok().put("courseList", list);
    }

}
