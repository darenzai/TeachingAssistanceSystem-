package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.hujiayi.auxiliaryteach.edu.service.ChapterService;
import com.hujiayi.auxiliaryteach.edu.vo.ChapterVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程章节 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/chapter")
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    // 添加章节
    @PostMapping("/add/chapter")
    public R addChapter(@RequestBody Chapter chapter) {
        chapterService.save(chapter);
        return R.ok();
    }

    // 根据id查询章节
    @GetMapping("/get/chapter/{id}")
    public R getChapterById(@PathVariable("id") String id) {
        Chapter chapter = chapterService.getById(id);
        return R.ok().put("chapter", chapter);
    }

    // 更新章节
    @PutMapping("/update/chapter")
    public R updateChapter(@RequestBody Chapter chapter) {
        chapterService.updateById(chapter);
        return R.ok();
    }

    // 根据id删除章节
    @DeleteMapping("/delete/chapter/{id}")
    public R deleteChapterById(@PathVariable("id") String id) {
        // 删除视频
        chapterService.deleteVideoByChapterId(id);
        chapterService.deleteChapterById(id);
        return R.ok();
    }

    // 根据课程id查询课程的章节和小节
    @GetMapping("/get/chapter/video/list/{id}")
    public R getChapterAndVideoSectionByCourseId(@PathVariable("id") String id) {
        List<ChapterVo> chapterList = chapterService.getChapterAndVideoSectionByCourseId(id);
        return R.ok().put("chapterList", chapterList);
    }

    @GetMapping("/get/chapter/course/{courseId}")
    public R getChapterByCourseId(@PathVariable("courseId") String courseId) {
        List<Chapter> chapterList = chapterService.getChapterByCourseId(courseId);
        return R.ok().put("chapterList", chapterList);
    }

}

