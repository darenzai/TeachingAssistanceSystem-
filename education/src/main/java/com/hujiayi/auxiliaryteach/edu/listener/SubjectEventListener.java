package com.hujiayi.auxiliaryteach.edu.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import com.hujiayi.auxiliaryteach.edu.entity.excel.SubjectExcelData;
import com.hujiayi.auxiliaryteach.edu.service.SubjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import java.util.Map;

public class SubjectEventListener extends AnalysisEventListener<SubjectExcelData> {

    private SubjectService subjectService;

    public SubjectEventListener() {
    }

    public SubjectEventListener(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    // 核心方法，处理表格数据
    @Override
    public void invoke(SubjectExcelData subjectData, AnalysisContext analysisContext) {

        // 1. 校验数据有效性
        if(subjectData == null) {
            throw new XliException(20001, "该Excel为空");
        }

        // 2. 处理一级分类
        String oneLevelSubjectName = subjectData.getOneLevelSubjectName();
        Subject oneLevelSubject = existOneLevelSubject(subjectService, oneLevelSubjectName);
        if(oneLevelSubject == null) {
            oneLevelSubject = new Subject();
            oneLevelSubject.setTitle(oneLevelSubjectName);
            oneLevelSubject.setParentId("0");
            subjectService.save(oneLevelSubject);
        }
        // 3. 获取一级分类的id以及二级分类名称
        String oneLevelSubjectId = oneLevelSubject.getId();
        String twoLevelSubjectName = subjectData.getTwoLevelSubjectName();

        // 4. 处理二级分类
        Subject twoLevelSubject = existTwoLevelSubject(subjectService, twoLevelSubjectName, oneLevelSubjectId);
        if(twoLevelSubject == null) {
            twoLevelSubject = new Subject();
            twoLevelSubject.setTitle(twoLevelSubjectName);
            twoLevelSubject.setParentId(oneLevelSubjectId);
            subjectService.save(twoLevelSubject);
        }
    }

    // 判断是否存在该一级分类
    public Subject existOneLevelSubject(SubjectService subjectService, String oneLevelSubjectName)  {
        QueryWrapper<Subject> wrapper = new QueryWrapper<Subject>();
        wrapper.eq("title", oneLevelSubjectName);
        wrapper.eq("parent_id", "0");
        Subject subject = subjectService.getOne(wrapper);
        return subject;
    }

    // 判断是否存在该二级分类
    public Subject existTwoLevelSubject(SubjectService subjectService,
                                        String twoLevelSubjectName, String oneLevelSubjectId) {
        QueryWrapper<Subject> wrapper = new QueryWrapper<Subject>();
        wrapper.eq("title", twoLevelSubjectName);
        wrapper.eq("parent_id", oneLevelSubjectId);
        Subject subject = subjectService.getOne(wrapper);
        return subject;
    }

    // 所有数据处理完之后执行的方法。
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }

    // 输出表头信息
    @Override
    public void invokeHeadMap(Map<Integer, String> headMap, AnalysisContext context) {
        System.out.println("表头信息:" + headMap);
    }
    
}
