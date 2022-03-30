package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.Teacher;
import com.hujiayi.auxiliaryteach.edu.vo.TeacherVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface TeacherService extends IService<Teacher> {

    Map<String, Object> getTeacherForPageLimit(TeacherVo teacherVo, Long current, Long size);

    List<Map<String, Object>> getTeacherNameListByKey(String key);

    Map<String, Object> getTeacherInfoById(String id);

    List<Teacher> getHotTeacher();
}
