package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.common.utils.JwtInfo;
import com.hujiayi.auxiliaryteach.common.utils.JwtUtils;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.entity.CourseComment;
import com.hujiayi.auxiliaryteach.edu.service.CourseCommentService;
import com.hujiayi.auxiliaryteach.edu.service.CourseService;
import com.hujiayi.auxiliaryteach.edu.vo.CommentPerfectVo;
import com.hujiayi.auxiliaryteach.edu.vo.CommentResultVo;
import com.hujiayi.auxiliaryteach.edu.vo.CommentVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 评论 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/course/comment")
public class CourseCommentController {

    @Autowired
    private CourseCommentService courseCommentService;

    @Autowired
    private CourseService courseService;

    // 评论列表
    @RequestMapping(value = "/page/{current}/{size}", method = RequestMethod.POST)
    public R pageList(@PathVariable Long current,
                      @PathVariable Long size,
                      @RequestBody CommentVo commentVo) {
        Page<CourseComment> courseCommentPage = new Page<>(current, size);
        QueryWrapper<CourseComment> wrapper = new QueryWrapper<>();

        String courseId = commentVo.getCourseId();
        Integer type = commentVo.getType();

        if(type == 1) { // 按照热度排序
            wrapper.orderByDesc("support_num");
        }else { // 按照创建的时间排序
            wrapper.orderByDesc("gmt_create");
        }

        wrapper.eq("course_id", courseId);

        IPage<CourseComment> page = courseCommentService.page(courseCommentPage, wrapper);
        long total = page.getTotal();
        List<CourseComment> records = page.getRecords();
        return R.ok().put("records", records).put("total", total);
    }

    // 添加评论
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public R edit(@RequestBody CourseComment courseComment,
                  HttpServletRequest request) {
        System.out.println("courseComment:" + courseComment);
        JwtInfo memberInfo = JwtUtils.getMemberIdByJwtToken(request);
        String avatar = memberInfo.getAvatar();
        String id = memberInfo.getId();
        String nickname = memberInfo.getNickname();
        if(StringUtils.isEmpty(id) || StringUtils.isEmpty(nickname) || StringUtils.isEmpty(avatar)) {
            throw new XliException(20001, "用户信息异常o(╥﹏╥)o");
        }
        courseComment.setAvatar(avatar);
        courseComment.setMemberId(id);
        courseComment.setNickname(nickname);
        courseCommentService.save(courseComment);
        return R.ok();
    }

    // 点赞, 更新评论
    @RequestMapping(value = "/update/{commentId}", method = RequestMethod.POST)
    public R update(@PathVariable("commentId") String commentId, HttpServletRequest request) {
        CourseComment old = courseCommentService.getById(commentId);
        JwtInfo memberInfo = JwtUtils.getMemberIdByJwtToken(request);
        String memberId = memberInfo.getId();
        CourseComment current = new CourseComment();
        if(old.getMemberId().equals(memberId)) {
            if(old.getStatus() == 1) {
                current.setId(commentId);
                current.setSupportNum(old.getSupportNum() - 1);
                current.setStatus(0);
                courseCommentService.updateById(current);
            }else {
                current.setId(commentId);
                current.setSupportNum(old.getSupportNum() + 1);
                current.setStatus(1);
                courseCommentService.updateById(current);
            }
        }else {
            if(old.getStatus() == 1) {
                current.setId(commentId);
                current.setSupportNum(old.getSupportNum() + 1);
                current.setStatus(0);
                courseCommentService.updateById(current);
            }else {
                current.setId(commentId);
                current.setSupportNum(old.getSupportNum() - 1);
                current.setStatus(1);
                courseCommentService.updateById(current);
            }
        }
        return R.ok();
    }

    // 获取课程的评论数. 和课程评价平均分
    @RequestMapping(value = "/select/{courseId}", method = RequestMethod.POST)
    public R select(@PathVariable String courseId) {
        // 1. 查询一共有多少条评价
        QueryWrapper<CourseComment> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        int count = courseCommentService.count(wrapper);

        // 2. 查询该课程的评价平均分
        QueryWrapper<CourseComment> scoreWrapper = new QueryWrapper<>();
        scoreWrapper.eq("course_id", courseId);
        scoreWrapper.select("score");
        List<Map<String, Object>> maps = courseCommentService.listMaps(scoreWrapper);

        double sum = 0;
        for (int i = 0; i < maps.size(); i++) {
            int score = (int)maps.get(i).get("score");
            sum += score;
        }
        double avg = sum / maps.size();
        avg = (double) Math.round(avg * 10) / 10;
        return R.ok().put("count", count).put("avg", avg);
    }

    // 获取评论前十的课程
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public R getCourseIdByScoreSort() {
        List<CommentResultVo> courseComments = courseCommentService.getCourseIdByScoreSort();
        return R.ok().put("courseComments", courseComments);
    }

    // 获取精彩的评论
    @RequestMapping(value = "/perfect/list/{current}/{size}", method = RequestMethod.POST)
    public R getPerfectComment(@PathVariable Long current,
                               @PathVariable Long size) {
        Page<CourseComment> page = new Page<>(current, size);
        QueryWrapper<CourseComment> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("support_num");
        IPage<CourseComment> iPage = courseCommentService.page(page, wrapper);
        List<CourseComment> records = iPage.getRecords();
        long total = iPage.getTotal();
        List<CommentPerfectVo> collectComment = records.stream().map(item -> {
            CommentPerfectVo commentPerfectVo = new CommentPerfectVo();
            BeanUtils.copyProperties(item, commentPerfectVo);
            Course course = courseService.getById(item.getCourseId());
            commentPerfectVo.setCourseName(course.getTitle());
            return commentPerfectVo;
        }).collect(Collectors.toList());
        return R.ok().put("total", total).put("collectComment", collectComment);
    }

}
