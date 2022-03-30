package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.edu.entity.CourseComment;
import com.hujiayi.auxiliaryteach.edu.mapper.CourseCommentMapper;
import com.hujiayi.auxiliaryteach.edu.service.CourseCommentService;
import com.hujiayi.auxiliaryteach.edu.vo.CommentResultVo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class CourseCommentServiceImpl extends ServiceImpl<CourseCommentMapper, CourseComment> implements CourseCommentService {

    @Override
    public List<CommentResultVo> getCourseIdByScoreSort() {
        return this.baseMapper.getCourseIdByScoreSort();
    }

}
