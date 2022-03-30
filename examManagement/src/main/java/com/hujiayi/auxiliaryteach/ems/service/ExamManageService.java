package com.hujiayi.auxiliaryteach.ems.service;

import com.hujiayi.auxiliaryteach.ems.entity.ExamManage;
import com.hujiayi.auxiliaryteach.ems.vo.ExamQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.ExamVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
public interface ExamManageService extends IService<ExamManage> {

    Map<String, Object> getExamListByConditionPage(ExamQueryVo examQueryVo, Long current, Long size);

    List<Map<String, Object>> getExamTitleListByKey(String key);

    void insertExam(ExamVo examVo);

    void updateExam(ExamVo examVo);

    ExamVo select(String id);
}
