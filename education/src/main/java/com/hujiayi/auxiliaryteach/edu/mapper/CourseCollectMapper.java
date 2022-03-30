package com.hujiayi.auxiliaryteach.edu.mapper;

import com.hujiayi.auxiliaryteach.edu.entity.CourseCollect;
import com.hujiayi.auxiliaryteach.edu.vo.CourseCollectionVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 课程收藏 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseCollectMapper extends BaseMapper<CourseCollect> {

    List<CourseCollectionVo> getCourseCollectionList(String memberId);
}
