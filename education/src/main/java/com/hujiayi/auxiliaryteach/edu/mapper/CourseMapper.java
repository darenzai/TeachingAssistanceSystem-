package com.hujiayi.auxiliaryteach.edu.mapper;

import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.vo.CoursePublishVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseMapper extends BaseMapper<Course> {

    List<CourseVo> getCourseListByCondition(Page<CourseVo> page, @Param(Constants.WRAPPER) QueryWrapper<CourseVo> wrapper);

    CoursePublishVo getCoursePublishInfoById(String id);

    WebCourseVo webCourseVoById(String courseId);
}
