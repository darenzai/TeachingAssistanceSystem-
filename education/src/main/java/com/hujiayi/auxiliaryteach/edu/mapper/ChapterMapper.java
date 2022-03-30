package com.hujiayi.auxiliaryteach.edu.mapper;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 课程章节 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface ChapterMapper extends BaseMapper<Chapter> {

    CourseDto selectCourseDtoById(String courseId);

}
