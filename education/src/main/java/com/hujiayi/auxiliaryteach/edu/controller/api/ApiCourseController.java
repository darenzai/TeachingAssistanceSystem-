package com.hujiayi.auxiliaryteach.edu.controller.api;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.service.ChapterService;
import com.hujiayi.auxiliaryteach.edu.service.CourseCommentService;
import com.hujiayi.auxiliaryteach.edu.service.CourseService;
import com.hujiayi.auxiliaryteach.edu.vo.ChapterVo;
import com.hujiayi.auxiliaryteach.edu.vo.CommentResultVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/edu/front/course")
@RestController
public class ApiCourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private ChapterService chapterService;

    @Autowired
    private CourseCommentService courseCommentService;

    // 查询课程根据条件
    @PostMapping("/get/course/list")
    public R getCourseListByCondition(@RequestBody WebCourseQueryVo webCourseQueryVo) {
        List<Course> courseList = courseService.webSelectList(webCourseQueryVo);
        return R.ok().put("courseList", courseList);
    }

    // 根据课程id查询课程
    @GetMapping("/get/course/info/{courseId}")
    public R getCourseInfoById(@PathVariable("courseId") String courseId) {
        // 1. 根据课程id查询, 课程信息和讲师信息
        WebCourseVo webCourseVo = courseService.webCourseVoById(courseId);
        // 2. 查询当前课程的章节信息
        List<ChapterVo> chapterVoList = chapterService.getChapterAndVideoSectionByCourseId(courseId);
        return R.ok().put("chapterVoList", chapterVoList).put("course", webCourseVo);
    }

    // 根据课程id, 返回CourseDto, 用于远程调用
    @GetMapping("/get/course/dto/{courseId}")
    public CourseDto getCourseDtoById(@PathVariable("courseId") String courseId) {
        CourseDto courseDto = courseService.getCourseDtoById(courseId);
        return courseDto;
    }

    // 根据课程id更改销售量
    @PutMapping("/update/buycount/{id}")
    public R updateBuyCountById(@PathVariable("id") String id) {
        courseService.updateBuyCountById(id);
        return R.ok();
    }

    // 热门排行TOP 50
    @RequestMapping(value = "/hot/page/{current}/{size}", method = RequestMethod.POST)
    public R hotPageList(@PathVariable("current") Long current,
                      @PathVariable("size") Long size) {
        Page<Course> coursePage = new Page<>(current, size);
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("view_count");
        IPage<Course> page = courseService.page(coursePage, wrapper);
        List<Course> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().put("hotCourses", records).put("total", total);
    }

    // 新课排行
    @RequestMapping(value = "/new/page/{current}/{size}", method = RequestMethod.POST)
    public R newCourseList(@PathVariable("current") Long current,
                      @PathVariable("size") Long size) {
        Page<Course> coursePage = new Page<>(current, size);
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("gmt_create");
        IPage<Course> page = courseService.page(coursePage, wrapper);
        List<Course> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().put("newCourses", records).put("total", total);
    }

    // 五星好评课程排行
    @RequestMapping(value = "/good/page/{current}/{size}", method = RequestMethod.POST)
    public R goodCourseList(@PathVariable("current") Long current,
                            @PathVariable("size") Long size) {
        List<CommentResultVo> courseIdByScoreSort = courseCommentService.getCourseIdByScoreSort();
        List<Course> courses = new ArrayList<>();
        courseIdByScoreSort.forEach(item -> {
            courses.add(courseService.getById(item.getCourseId()));
        });
        List<Course> goodCourses = new ArrayList<>();
        if(current == 1) {
            for(int i = 0; i < 5; i++) {
                goodCourses.add(courses.get(i));
            }
        }else {
            for(int i = 5; i < 10; i++) {
                goodCourses.add(courses.get(i));
            }
        }
        return R.ok().put("goodCourses", goodCourses);
    }

}
