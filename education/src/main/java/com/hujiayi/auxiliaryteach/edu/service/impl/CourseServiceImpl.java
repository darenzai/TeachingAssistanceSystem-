package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.common.dto.CourseDto;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.entity.VideoSection;
import com.hujiayi.auxiliaryteach.edu.mapper.ChapterMapper;
import com.hujiayi.auxiliaryteach.edu.mapper.CourseMapper;
import com.hujiayi.auxiliaryteach.edu.mapper.VideoSectionMapper;
import com.hujiayi.auxiliaryteach.edu.service.ChapterService;
import com.hujiayi.auxiliaryteach.edu.service.CourseService;
import com.hujiayi.auxiliaryteach.edu.vo.CourseInfoVo;
import com.hujiayi.auxiliaryteach.edu.vo.CoursePublishVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.CourseVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseQueryVo;
import com.hujiayi.auxiliaryteach.edu.vo.web.WebCourseVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class CourseServiceImpl extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Autowired
    private ChapterService chapterService;

    @Autowired(required = false)
    private ChapterMapper chapterMapper;

    @Autowired(required = false)
    private VideoSectionMapper videoSectionMapper;

    // 保存课程信息, 返回课程的id
    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        if(courseInfoVo == null) {
            throw new XliException(20001, "错误, CourseInfoVo信息为null o(╥﹏╥)o");
        }
        Course course = new Course();
        BeanUtils.copyProperties(courseInfoVo, course);
        course.setStatus(Course.COURSE_DRAFT);
        this.baseMapper.insert(course);
        String courseId = course.getId();
        return courseId;
    }

    // 根据课程id查询课程
    @Override
    public CourseInfoVo getCourseById(String id) {
        CourseInfoVo courseInfoVo = new CourseInfoVo();
        Course course = this.baseMapper.selectById(id);
        if(course == null) {
            throw new XliException(20001, "该课程不存在 o(╥﹏╥)o");
        }
        BeanUtils.copyProperties(course, courseInfoVo);
        return courseInfoVo;
    }

    // 更新课程信息
    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        if(courseInfoVo == null) {
            throw new XliException(20001, "该课程信息为空 o(╥﹏╥)o");
        }
        Course course = new Course();
        BeanUtils.copyProperties(courseInfoVo, course);
        course.setStatus(Course.COURSE_DRAFT);
        this.baseMapper.updateById(course);
    }

    // 分页条件查询课程信息, 完善课程列表信息
    @Override
    public IPage<CourseVo> getCourseListByCondition(CourseQueryVo courseQueryVo, Long current, Long size) {

        QueryWrapper<CourseVo> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("c.gmt_create");
        wrapper.eq("c.is_deleted", 0);

        String title = courseQueryVo.getTitle();
        String teacherId = courseQueryVo.getTeacherId();
        String subjectParentId = courseQueryVo.getSubjectParentId();
        String subjectId = courseQueryVo.getSubjectId();

        if (!StringUtils.isEmpty(title)) {
            wrapper.like("c.title", title);
        }

        if (!StringUtils.isEmpty(teacherId) ) {
            wrapper.eq("c.teacher_id", teacherId);
        }

        if (!StringUtils.isEmpty(subjectParentId)) {
            wrapper.eq("c.subject_parent_id", subjectParentId);
        }

        if (!StringUtils.isEmpty(subjectId)) {
            wrapper.eq("c.subject_id", subjectId);
        }


        Page<CourseVo> page = new Page<>(current, size);
        // 放入分页参数和查询条件参数，mp会自动组装
        List<CourseVo> records =  baseMapper.getCourseListByCondition(page, wrapper);
        page.setRecords(records);
        return page;
    }

    // 根据课程id查询, 发布课程的信息
    @Override
    public CoursePublishVo getCoursePublishInfoById(String id) {
        CoursePublishVo coursePublishVo = this.baseMapper.getCoursePublishInfoById(id);
        return coursePublishVo;
    }

    // 发布课程
    @Override
    public void publishCourseById(String id) {
        Course course = new Course();
        course.setId(id);
        course.setStatus(Course.COURSE_NORMAL);
        this.baseMapper.updateById(course);
    }

    // 删除课程下所有章节和章节下小节视频根据课程id
    @Override
    public void deleteChapterAndVideoByCourseId(String id) {
        // 1. 查询该课程下所有对应的章节id
        QueryWrapper<Chapter> wrapper = new QueryWrapper<>();
        wrapper.select("id");
        wrapper.eq("course_id", id);
        List<Map<String, Object>> maps = chapterMapper.selectMaps(wrapper);
        if(maps == null || maps.size() == 0) {
            return ;
        }
        Map<String, Object> validMap = maps.get(0);
        if(validMap != null && validMap.size() > 0) {
            maps.forEach(map -> {
                String chapterId = (String)map.get("id");
                // 删除视频
                chapterService.deleteVideoByChapterId(chapterId);
                // 删除课时
                QueryWrapper<VideoSection> wrapper1 = new QueryWrapper<>();
                wrapper1.eq("chapter_id",chapterId );
                videoSectionMapper.delete(wrapper1);
                // 删除章节
                chapterService.deleteChapterById(chapterId);
            });
        }
    }

    // 查询课程根据条件(前台请求)
    @Override
    public List<Course> webSelectList(WebCourseQueryVo webCourseQueryVo) {

        QueryWrapper<Course> queryWrapper = new QueryWrapper<>();

        //查询已发布的课程
        queryWrapper.eq("status", Course.COURSE_NORMAL);

        if (!StringUtils.isEmpty(webCourseQueryVo.getSubjectParentId())) {
            queryWrapper.eq("subject_parent_id", webCourseQueryVo.getSubjectParentId());
        }

        if (!StringUtils.isEmpty(webCourseQueryVo.getSubjectId())) {
            queryWrapper.eq("subject_id", webCourseQueryVo.getSubjectId());
        }

        if (!StringUtils.isEmpty(webCourseQueryVo.getBuyCountSort())) {
            queryWrapper.orderByDesc("buy_count");
        }

        if (!StringUtils.isEmpty(webCourseQueryVo.getGmtCreateSort())) {
            queryWrapper.orderByDesc("gmt_create");
        }

        if (!StringUtils.isEmpty(webCourseQueryVo.getPriceSort())) {
            if(webCourseQueryVo.getType() == null || webCourseQueryVo.getType() == 1) {
                queryWrapper.orderByAsc("price");
            }else {
                queryWrapper.orderByDesc("price");
            }
        }
        return baseMapper.selectList(queryWrapper);
    }

    // 根据课程id查询课程(前台请求)
    @Override
    public WebCourseVo webCourseVoById(String courseId) {
        // 1. 根据课程id查询课程, 更新访问课程的浏览数
        Course course = this.getById(courseId);
        course.setViewCount(course.getViewCount() + 1);
        // 2. 更新数据
        this.updateById(course);
        // 3. 调用自定义SQL, 返回WebCourseVo
        return baseMapper.webCourseVoById(courseId);
    }

    // 获取热门课程
    @Cacheable(value = "index", key = "'selectHotCourse'")
    @Override
    public List<Course> getHotCourse() {
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("view_count");
        wrapper.last("limit 8");
        List<Course> courses = this.baseMapper.selectList(wrapper);
        return courses;
    }

    @Override
    public CourseDto getCourseDtoById(String courseId) {
        return chapterMapper.selectCourseDtoById(courseId);
    }

    // 根据课程id, 更新课程销量
    @Override
    public void updateBuyCountById(String id) {
        // 1. 根据id查询课程, 然后更新
        Course course = this.getById(id);
        course.setBuyCount(course.getBuyCount() + 1);
        this.updateById(course);
    }

}
