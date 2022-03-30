package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.CourseCollect;
import com.hujiayi.auxiliaryteach.edu.vo.CourseCollectionVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程收藏 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseCollectService extends IService<CourseCollect> {

    Boolean isCollection(String courseId, String memberId);

    void addCollection(String courseId, String memberId);

    boolean cancelCourseCollection(String courseId, String memberId);

    List<CourseCollectionVo> getCourseCollectionList(String memberId);
}
