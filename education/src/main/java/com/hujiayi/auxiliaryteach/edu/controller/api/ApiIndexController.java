package com.hujiayi.auxiliaryteach.edu.controller.api;

import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.entity.Teacher;
import com.hujiayi.auxiliaryteach.edu.service.CourseService;
import com.hujiayi.auxiliaryteach.edu.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 获取热门课程和讲师
 */
@RestController
@RequestMapping("/edu/front/index")
public class ApiIndexController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    // 获取热门课程列表和热门讲师列表
    @GetMapping("/get/course/teacher/list")
    public R getCourseAndTeacherList() {
        // 获取首页最热门前8条课程数据
        List<Course> courseList =  courseService.getHotCourse();
        // 获取首页推荐前8条讲师数据
        List<Teacher> teacherList = teacherService.getHotTeacher();
        return R.ok().put("courseList", courseList).put("teacherList", teacherList);
    }

}
