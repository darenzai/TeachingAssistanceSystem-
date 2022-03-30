package com.hujiayi.auxiliaryteach.edu.mapper;

import com.hujiayi.auxiliaryteach.edu.entity.CourseComment;
import com.hujiayi.auxiliaryteach.edu.vo.CommentResultVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 评论 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseCommentMapper extends BaseMapper<CourseComment> {

    List<CommentResultVo> getCourseIdByScoreSort();

}
