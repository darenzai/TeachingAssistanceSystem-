package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.edu.service.CourseCollectService;
import com.hujiayi.auxiliaryteach.edu.vo.CourseCollectionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 课程收藏 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/course/collect")
public class CourseCollectController {

    @Autowired
    private CourseCollectService courseCollectService;

    // 1. 判断用户是否收藏课程
    @GetMapping("/is/collection/{courseId}")
    public R isCollection(@PathVariable("courseId") String courseId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        // 2. 判断用户是否收藏
        Boolean isCollect = courseCollectService.isCollection(courseId, memberId);
        return R.ok().put("isCollect", isCollect);
    }

    // 2. 收藏课程
    @PostMapping("/add/collection/{courseId}")
    public R addCollection(@PathVariable("courseId") String courseId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        // 2.
        courseCollectService.addCollection(courseId, memberId);
        return R.ok();
    }

    // 3. 取消收藏课程
    @DeleteMapping("/delete/course/collection/{courseId}")
    public R cancelCourseCollection(@PathVariable("courseId") String courseId, HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        // 2. 删除..
        boolean result = courseCollectService.cancelCourseCollection(courseId, memberId);
        return result?R.ok():R.error().message("取出收藏错误o(╥﹏╥)o");
    }

    // 4. 获取收藏列表, 根据用户id
    @GetMapping("/get/course/collection/list")
    public R getCourseCollectionList(HttpServletRequest request) {
        // 1. 通过request, 使用jwt工具, 解析token, 拿到用户数据
        JwtInfo jwtInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = jwtInfo.getId();
        // 2. ..
        List<CourseCollectionVo> list = courseCollectService.getCourseCollectionList(memberId);
        return R.ok().put("items", list);
    }

}

