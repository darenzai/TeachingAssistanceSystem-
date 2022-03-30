package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.edu.entity.Chapter;
import com.hujiayi.auxiliaryteach.edu.entity.VideoSection;
import com.hujiayi.auxiliaryteach.edu.mapper.ChapterMapper;
import com.hujiayi.auxiliaryteach.edu.mapper.VideoSectionMapper;
import com.hujiayi.auxiliaryteach.edu.service.ChapterService;
import com.hujiayi.auxiliaryteach.edu.service.feign.VodFeignService;
import com.hujiayi.auxiliaryteach.edu.vo.ChapterVo;
import com.hujiayi.auxiliaryteach.edu.vo.VideoSectionVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程章节 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class ChapterServiceImpl extends ServiceImpl<ChapterMapper, Chapter> implements ChapterService {

    @Autowired(required = false)
    private VideoSectionMapper videoSectionMapper;

    @Autowired
    private VodFeignService vodFeignService;

    // 根据章节id, 删除该章节下所有视频
    @Override
    public void deleteVideoByChapterId(String id) {
        // 1. 编写语句
        QueryWrapper<VideoSection> wrapper = new QueryWrapper<>();
        wrapper.select("video_source_id");
        wrapper.eq("chapter_id", id);
        // 2. 调用map, 获取的是key,value集合
        List<Map<String, Object>> maps = videoSectionMapper.selectMaps(wrapper);
//        List<VideoSection> videoSectionList = videoSectionMapper.selectList(wrapper);
//        System.out.println(videoSectionList.toString());
        // 3. 遍历, 先创建一个集合用于存储ids
        if(maps == null || maps.size() == 0) {
            return ;
        }
        System.out.println("maps:" + maps);
        Map<String, Object> validMap = maps.get(0);
        if( null != validMap && validMap.size() > 0 ) {
            List<String> videoSourceIdList = new ArrayList<>();
            maps.forEach(map -> {
                String videoSourceId = (String)map.get("video_source_id");
                if(!StringUtils.isEmpty(videoSourceId)) {
                    videoSourceIdList.add(videoSourceId);
                }
            });
            // 4. 通过openfeign进行远程调用来删除该章节下小节的视频
            vodFeignService.deleteVideoByIds(videoSourceIdList);
        }
    }

    // 根据id删除章节
    @Override
    public void deleteChapterById(String id) {
        // 删除章节对应的课时
        QueryWrapper<VideoSection> wrapper = new QueryWrapper<>();
        wrapper.eq("chapter_id", id);
        videoSectionMapper.delete(wrapper);

        // 删除当前章节
        this.removeById(id);
    }

    // 根据课程id查询课程的章节和小节
    @Override
    public List<ChapterVo> getChapterAndVideoSectionByCourseId(String id) {

        List<ChapterVo> chapterVoList = new ArrayList<>();

        //获取章信息
        QueryWrapper<Chapter> queryWrapperChapter = new QueryWrapper<>();
        queryWrapperChapter.eq("course_id", id);
        queryWrapperChapter.orderByAsc("sort", "id");
        List<Chapter> chapterList = baseMapper.selectList(queryWrapperChapter);

        //获取课时信息
        QueryWrapper<VideoSection> queryWrapperVideo = new QueryWrapper<>();
        queryWrapperVideo.eq("course_id", id);
        queryWrapperVideo.orderByAsc("sort", "id");
        List<VideoSection> videoList = videoSectionMapper.selectList(queryWrapperVideo);

        //填充列表数据：Chapter列表
        for (int i = 0; i < chapterList.size(); i++) {
            Chapter chapter = chapterList.get(i);

            //创建ChapterVo对象
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(chapter, chapterVo);
            chapterVoList.add(chapterVo);

            //填充列表数据：Video列表
            List<VideoSectionVo> videoVoList = new ArrayList<>();
            for (int j = 0; j < videoList.size(); j++) {
                VideoSection video = videoList.get(j);
                if(chapter.getId().equals(video.getChapterId())){
                    VideoSectionVo videoVo = new VideoSectionVo();
                    videoVo.setFree(video.getIsFree());
                    BeanUtils.copyProperties(video, videoVo);
                    videoVoList.add(videoVo);
                }
            }

            chapterVo.setChildren(videoVoList);
        }

        return chapterVoList;
    }

    @Override
    public List<Chapter> getChapterByCourseId(String courseId) {
        QueryWrapper<Chapter> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id ", courseId);
        return this.baseMapper.selectList(wrapper);
    }

}

