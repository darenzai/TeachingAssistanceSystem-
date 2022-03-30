package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.alibaba.excel.EasyExcel;
import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import com.hujiayi.auxiliaryteach.edu.entity.excel.SubjectExcelData;
import com.hujiayi.auxiliaryteach.edu.listener.SubjectEventListener;
import com.hujiayi.auxiliaryteach.edu.mapper.SubjectMapper;
import com.hujiayi.auxiliaryteach.edu.service.SubjectService;
import com.hujiayi.auxiliaryteach.edu.vo.OneLevelSubjectVo;
import com.hujiayi.auxiliaryteach.edu.vo.TwoLevelSubjectVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements SubjectService {

    /**
     * 传入excel, 解析excel表, 插入数据到数据库
     * @param file 传入的文件
     * @param subjectService
     */
    @Override
    public void  analysisExcelDataByEasyExcel(MultipartFile file, SubjectService subjectService) {
        try {
            InputStream inputStream = file.getInputStream();
            EasyExcel.read(inputStream, SubjectExcelData.class, new SubjectEventListener(subjectService)).sheet().doRead();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询所有学科
     */
    @Override
    public List<OneLevelSubjectVo> getAllSubjects() {

        List<OneLevelSubjectVo> tempOneSubject = new ArrayList<>();
        // 1. 拿到所有一级学科
        QueryWrapper<Subject> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", "0");
        List<Subject> oneLevelSubject = this.baseMapper.selectList(wrapper);

        List<OneLevelSubjectVo> subjects = oneLevelSubject.stream().map(oneSubject -> {
                    OneLevelSubjectVo oneLevelSubjectVo = new OneLevelSubjectVo();
                    BeanUtils.copyProperties(oneSubject, oneLevelSubjectVo);
                    List<TwoLevelSubjectVo> childs = getChilds(oneSubject);
                    oneLevelSubjectVo.setChilds(childs);
                    tempOneSubject.add(oneLevelSubjectVo);
                    return oneLevelSubjectVo;
                }).collect(Collectors.toList());

        return subjects;
    }

    public List<TwoLevelSubjectVo> getChilds(Subject subject) {
        List<TwoLevelSubjectVo> twoLevelSubjects = new ArrayList<>();

        List<Subject> twoLevelSubject = this.baseMapper.selectList(
                new QueryWrapper<Subject>().ne("parent_id", "0"));

        twoLevelSubject.forEach(twoSubject -> {
            if(subject.getId().equals(twoSubject.getParentId())) {
                TwoLevelSubjectVo twoLevelSubjectVo = new TwoLevelSubjectVo();
                BeanUtils.copyProperties(twoSubject, twoLevelSubjectVo);
                twoLevelSubjects.add(twoLevelSubjectVo);
            }
        });
        return twoLevelSubjects;
    }

    // 添加学科
    @Override
    public void appendSubject(TwoLevelSubjectVo twoLevelSubjectVo) {

        if(twoLevelSubjectVo == null) {
            throw new XliException(20001, "该twoLevelSubjectVo数据为null");
        }

        String title = twoLevelSubjectVo.getTitle();
        String parentId = twoLevelSubjectVo.getParentId();
        Subject subject = new Subject();
        if(!StringUtils.isEmpty(title)) {
            subject.setTitle(title);
        }
        if(!StringUtils.isEmpty(parentId)) {
            subject.setParentId(parentId);
        }
        this.save(subject);
    }

    // 根据id查询学科
    @Override
    public Subject getSubjectById(String sId) {
        if(!StringUtils.isEmpty(sId)) {
            Subject subject = this.getById(sId);
            return subject;
        }
        return null;
    }

    // 修改学科
    @Override
    public void editSubject(TwoLevelSubjectVo twoLevelSubjectVo) {

        if(twoLevelSubjectVo == null) {
            throw new XliException(20001, "该twoLevelSubjectVo数据为null");
        }

        Subject subject = new Subject();
        String id = twoLevelSubjectVo.getId();
        String parentId = twoLevelSubjectVo.getParentId();
        String title = twoLevelSubjectVo.getTitle();
        if(!StringUtils.isEmpty(id)) {
            subject.setId(id);
        }
        if(!StringUtils.isEmpty(parentId)) {
            subject.setParentId(parentId);
        }
        if(!StringUtils.isEmpty(title)) {
            subject.setTitle(title);
        }
        this.updateById(subject);
    }

    /**
     * 删除学科, 有两种情况
     * 1. 如果该学科是叶子节点, 则直接删除该节点
     * 2. 如果该学科是非叶子节点, 则直接删除整颗子树
     */
    @Override
    public void deleteSubject(String id) {
        if(StringUtils.isEmpty(id)) {
            throw new XliException(20001, "学科id不存在");
        }
        // 1. 根据id查询该学科，如果没找直接抛异常，如果找到了，判断parentId是否为0, 如果是0则直接删除整个子树, 如果不是0则删除该节点
        Subject subject = this.getById(id);
        if(subject != null) {
            this.removeById(id);
            if("0".equals(subject.getParentId())) { // 整颗子树
                this.baseMapper.deleteAllLeafNodeByParentId(id);
            }
        } else {
            throw new XliException(20001, "待删除的学科不存在，id为" + id);
        }

    }

    // 添加一级学科
    @Override
    public void addSubject(TwoLevelSubjectVo twoLevelSubjectVo) {
        Subject subject = new Subject();
        String title = twoLevelSubjectVo.getTitle();
        if(!StringUtils.isEmpty(title)) {
            subject.setTitle(title);
            subject.setParentId("0");
        }
        this.save(subject);
    }

    // 批量删除学科
    @Override
    public void batchDeleteSubjectByIds(String[] sIds) {
        this.baseMapper.deleteBatchIds(Arrays.asList(sIds));
    }

    // 该业务属于题目列表需要. 通过openfeign进行调用, 然后返回数据
//    @Override
//    public List<OneLevelSubjectDto> subjectDtoList() {
//        List<OneLevelSubjectDto> oneLevelSubjectDtoList = new ArrayList<OneLevelSubjectDto>();
//
//        // 1. 查询所有一级分类
//        QueryWrapper<Subject> oneWrapper = new QueryWrapper<>();
//        oneWrapper.eq("parent_id", 0);
//        List<Subject> oneSubjectList = this.baseMapper.selectList(oneWrapper);
//
//        // 2. 遍历一级分类
//        oneSubjectList.forEach(item -> {
//            OneLevelSubjectDto oneLevelSubjectDto = new OneLevelSubjectDto();
//            BeanUtils.copyProperties(item, oneLevelSubjectDto);
//            oneLevelSubjectDto.setChildren(getChildren(item.getId()));
//            oneLevelSubjectDtoList.add(oneLevelSubjectDto);
//        });
//        return oneLevelSubjectDtoList;
//    }
//
//    // 获取二级分类方法
//    public List<TwoLevelSubjectDto> getChildren(String id) {
//        List<TwoLevelSubjectDto> twoLevelSubjectDtoList = new ArrayList<TwoLevelSubjectDto>();
//
//        // 1. 查询所有二级分类
//        QueryWrapper<Subject> twoWrapper = new QueryWrapper<>();
//        twoWrapper.ne("parent_id", 0);
//        List<Subject> twoSubjectList = this.baseMapper.selectList(twoWrapper);
//
//        twoSubjectList.forEach(item -> {
//            TwoLevelSubjectDto twoLevelSubjectDto = new TwoLevelSubjectDto();
//            if(item.getParentId().equals(id)) {
//                BeanUtils.copyProperties(item, twoLevelSubjectDto);
//                twoLevelSubjectDtoList.add(twoLevelSubjectDto);
//            }
//        });
//
//        return twoLevelSubjectDtoList;
//    }

}
