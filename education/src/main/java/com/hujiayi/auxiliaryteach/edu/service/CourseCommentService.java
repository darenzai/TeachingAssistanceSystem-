package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.CourseComment;
import com.hujiayi.auxiliaryteach.edu.vo.CommentResultVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 评论 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseCommentService extends IService<CourseComment> {

    List<CommentResultVo> getCourseIdByScoreSort();

}
