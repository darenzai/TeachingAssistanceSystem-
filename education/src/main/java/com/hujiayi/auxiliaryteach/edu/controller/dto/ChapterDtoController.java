package com.hujiayi.auxiliaryteach.edu.controller.dto;

import com.hujiayi.auxiliaryteach.common.dto.ChapterDto;
import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.hujiayi.auxiliaryteach.edu.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/edu/chapter/dto")
@RestController
public class ChapterDtoController {

    @Autowired
    private ChapterService chapterService;

    @RequestMapping(value = "/select/{id}", method = RequestMethod.POST)
    public ChapterDto selectChapter(@PathVariable("id") String id) {
        ChapterDto chapterDto = new ChapterDto();
        Chapter chapter = chapterService.getById(id);
        chapterDto.setTitle(chapter.getTitle());
        return chapterDto;
    }

}
