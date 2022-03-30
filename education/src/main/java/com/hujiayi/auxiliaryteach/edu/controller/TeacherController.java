package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Teacher;
import com.hujiayi.auxiliaryteach.edu.service.TeacherService;
import com.hujiayi.auxiliaryteach.edu.vo.TeacherVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Slf4j
@RefreshScope // 开启nacos的config配置的动态刷新
@RestController
@RequestMapping("/edu/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Value("${edu.user.name}")
    private String name;

    @Value("${edu.user.age}")
    private Integer age;


    // 1. 查询所有讲师列表
    @GetMapping("/get/all/teachers")
    public R getAllTeachers() {
        List<Teacher> list = teacherService.list();
        return R.ok().put("teacherList", list);
    }

    // 2. 添加讲师
    @PostMapping("/add/teacher")
    public R addTeacher(@RequestBody @Valid Teacher teacher) {
        teacherService.save(teacher);
        return R.ok();
    }

    // 3. 修改讲师
    @PutMapping("/update/teacher")
    public R updateTeacher(@RequestBody Teacher teacher) {
        teacherService.updateById(teacher);
        return R.ok();
    }

    // 4. 删除讲师
    @DeleteMapping("/delete/teacher/{id}")
    public R deleteTeacherById(@PathVariable Long id) {
        teacherService.removeById(id);
        return R.ok();
    }

    // 5. 根据讲师id查询讲师
    @GetMapping("/get/teacher/{id}")
    public R getTeacherById(@PathVariable String id) {
        Teacher teacher = teacherService.getById(id);
        return teacher != null ? R.ok().put("teacher", teacher): R.error("该讲师不存在");
    }

    // 6. 多条件组合分页查询
    @PostMapping("/get/teacher/{current}/{size}")
    public R getTeacherForPageLimit(@RequestBody(required = false) TeacherVo teacherVo,
                                    @PathVariable("current") Long current,
                                    @PathVariable("size") Long size) {
        Map<String, Object> map = teacherService.getTeacherForPageLimit(teacherVo, current, size);
        List<Teacher> records = (List<Teacher>)map.get("data");
        long total = (long)map.get("total");
        return R.ok().put("total", total).put("pages", records);
    }

    // 7. 批量删除的方法
    @DeleteMapping("/delete/te0000acher")
    public R batchDeleteTeacher(String[] ids) {
        teacherService.removeByIds(Arrays.asList(ids));
        return R.ok();
    }

    // 8. 根据关键字查询讲师列表
    @GetMapping("/get/list/{key}")
    public R getTeacherNameListByKey(@PathVariable String key) {
        log.info("getTeacherNameListByKey：[{}]", key);
        List<Map<String, Object>> teacherNameList = teacherService.getTeacherNameListByKey(key);
        return R.ok().put("teacherNameList", teacherNameList);
    }

}

