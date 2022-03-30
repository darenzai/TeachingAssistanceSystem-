package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import com.hujiayi.auxiliaryteach.edu.vo.OneLevelSubjectVo;
import com.hujiayi.auxiliaryteach.edu.vo.TwoLevelSubjectVo;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface SubjectService extends IService<Subject> {

    void analysisExcelDataByEasyExcel(MultipartFile file, SubjectService subjectService);

    List<OneLevelSubjectVo> getAllSubjects();

    void appendSubject(TwoLevelSubjectVo twoLevelSubjectVo);

    Subject getSubjectById(String sId);

    void editSubject(TwoLevelSubjectVo twoLevelSubjectVo);

    void deleteSubject(String id);

    void addSubject(TwoLevelSubjectVo twoLevelSubjectVo);

    void batchDeleteSubjectByIds(String[] sIds);

//    List<OneLevelSubjectDto> subjectDtoList();
}
