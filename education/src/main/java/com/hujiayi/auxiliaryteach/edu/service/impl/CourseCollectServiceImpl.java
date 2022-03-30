package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.edu.entity.CourseCollect;
import com.hujiayi.auxiliaryteach.edu.mapper.CourseCollectMapper;
import com.hujiayi.auxiliaryteach.edu.service.CourseCollectService;
import com.hujiayi.auxiliaryteach.edu.vo.CourseCollectionVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 课程收藏 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Slf4j
@Service
public class CourseCollectServiceImpl extends ServiceImpl<CourseCollectMapper, CourseCollect> implements CourseCollectService {

    @Autowired
    private CourseCollectMapper courseCollectMapper;

    // 1. 判断用户是否收藏课程
    @Override
    public Boolean isCollection(String courseId, String memberId) {
        // 1. 校验数据
        if(StringUtils.isEmpty(courseId) || StringUtils.isEmpty(memberId)) {
            log.info("判断收藏课程异常o(╥﹏╥)o");
            throw new XliException(20001, "判断收藏课程异常o(╥﹏╥)o");
        }

        QueryWrapper<CourseCollect> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);
        wrapper.eq("member_id", memberId);
        return this.baseMapper.selectCount(wrapper) > 0;
    }

    // 2. 收藏课程
    @Override
    public void addCollection(String courseId, String memberId) {
        // 1. 校验数据
        if(StringUtils.isEmpty(courseId) || StringUtils.isEmpty(memberId)) {
            log.info("收藏课程异常o(╥﹏╥)o");
            throw new XliException(20001, "收藏课程异常o(╥﹏╥)o");
        }
        CourseCollect courseCollect = new CourseCollect();
        courseCollect.setCourseId(courseId);
        courseCollect.setMemberId(memberId);
        this.save(courseCollect);
    }

    // 3. 取消收藏课程
    @Override
    public boolean cancelCourseCollection(String courseId, String memberId) {
        // 1. 校验数据
        if(StringUtils.isEmpty(courseId) || StringUtils.isEmpty(memberId)) {
            log.info("取消收藏课程异常o(╥﹏╥)o");
            throw new XliException(20001, "取消收藏课程异常o(╥﹏╥)o");
        }
        // 2. ...
        if(this.isCollection(courseId, memberId)) {
            QueryWrapper<CourseCollect> wrapper = new QueryWrapper<>();
            wrapper.eq("course_id", courseId);
            wrapper.eq("member_id", memberId);
            return this.remove(wrapper);
        }
        return false;
    }

    // 4. 获取收藏列表, 根据用户id
    @Override
    public List<CourseCollectionVo> getCourseCollectionList(String memberId) {
        if (StringUtils.isEmpty(memberId)) {
            log.info("获取收藏课程异常o(╥﹏╥)o");
            throw new XliException(20001, "获取收藏课程异常o(╥﹏╥)o");
        }
        List<CourseCollectionVo> list = courseCollectMapper.getCourseCollectionList(memberId);
        return list;
    }


}
