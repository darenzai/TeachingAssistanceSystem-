package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.vo.CourseInfoVo;
import com.hujiayi.auxiliaryteach.edu.vo.CoursePublishVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface CourseService extends IService<Course> {

    String saveCourseInfo(CourseInfoVo courseInfoVo);

    CourseInfoVo getCourseById(String id);

    void updateCourseInfo(CourseInfoVo courseInfoVo);

    IPage<CourseVo> getCourseListByCondition(CourseQueryVo courseQueryVo, Long current, Long size);

    CoursePublishVo getCoursePublishInfoById(String id);

    void publishCourseById(String id);

    void deleteChapterAndVideoByCourseId(String id);

    List<Course> webSelectList(WebCourseQueryVo webCourseQueryVo);

    WebCourseVo webCourseVoById(String courseId);

    List<Course> getHotCourse();

    CourseDto getCourseDtoById(String courseId);

    void updateBuyCountById(String id);
}
