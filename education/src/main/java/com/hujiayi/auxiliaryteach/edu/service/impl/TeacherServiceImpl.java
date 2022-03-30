package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.edu.entity.Course;
import com.hujiayi.auxiliaryteach.edu.entity.Teacher;
import com.hujiayi.auxiliaryteach.edu.mapper.CourseMapper;
import com.hujiayi.auxiliaryteach.edu.mapper.TeacherMapper;
import com.hujiayi.auxiliaryteach.edu.service.TeacherService;
import com.hujiayi.auxiliaryteach.edu.vo.TeacherVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Autowired(required = false)
    private CourseMapper courseMapper;

    // 分页多条件查询
    @Override
    public Map<String, Object> getTeacherForPageLimit(TeacherVo teacherVo, Long current, Long size) {
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();

        String name = teacherVo.getName();
        Integer level = teacherVo.getLevel();
        Date begin = teacherVo.getBegin();
        Date end = teacherVo.getEnd();

        if(!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        if(!StringUtils.isEmpty(level)) {
            wrapper.eq("level", level);
        }
        if(!StringUtils.isEmpty(begin)) {
            wrapper.ge("gmt_create", begin);
        }
        if(!StringUtils.isEmpty(end)) {
            wrapper.le("gmt_create", end);
        }

        // 按创建时间降序
        wrapper.orderByDesc("gmt_create");

        Page<Teacher> page = new Page<>(current, size);

        IPage<Teacher> pages = this.baseMapper.selectPage(page, wrapper);
        long total = pages.getTotal();
        List<Teacher> records = pages.getRecords();

        HashMap<String, Object> map = new HashMap<>(16);
        map.put("total", total);
        map.put("data", records);
        return map;
    }

    // 根据关键字查询讲师列表
    @Override
    public List<Map<String, Object>> getTeacherNameListByKey(String key) {
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        wrapper.select("name");
        wrapper.likeRight("name", key);
        List<Map<String, Object>> maps = this.baseMapper.selectMaps(wrapper); // 返回map列表
        System.out.println(maps.toString());
        return maps;
    }

    /**
     * 前台请求
     *  根据讲师id查询讲师信息
     */
    @Override
    public Map<String, Object> getTeacherInfoById(String id) {
        // 1. 获取讲师个人信息
        Teacher teacher = this.getById(id);
        // 2. 获取讲师所讲的课程
        QueryWrapper<Course> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id", id);
        List<Course> courseList = courseMapper.selectList(wrapper);
        Map<String, Object> map = new HashMap<>(16);
        map.put("teacher", teacher);
        map.put("courseList", courseList);
        return map;
    }

    // 获取热门讲师
    @Cacheable(value = "index", key = "'selectHotTeacher'")
    @Override
    public List<Teacher> getHotTeacher() {
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("sort");
        wrapper.last("limit 8");
        return this.baseMapper.selectList(wrapper);
    }

}
