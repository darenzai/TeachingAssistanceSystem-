package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.hujiayi.auxiliaryteach.edu.vo.ChapterVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 课程章节 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface ChapterService extends IService<Chapter> {

    void deleteChapterById(String id);

    List<ChapterVo> getChapterAndVideoSectionByCourseId(String id);

    void deleteVideoByChapterId(String id);

    List<Chapter> getChapterByCourseId(String courseId);
}
