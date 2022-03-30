package com.hujiayi.auxiliaryteach.ems.service.impl;

import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.mapper.PaperManageMapper;
import com.hujiayi.auxiliaryteach.ems.service.PaperManageService;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionResultVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
@Service
public class PaperManageServiceImpl extends ServiceImpl<PaperManageMapper, PaperManage> implements PaperManageService {

    @Override
    public IPage<QuestionResultVo> pageList(QuestionQueryVo questionQueryVo, Long current, Long size) {

        // 1. 添加查询条件和校验
        QueryWrapper<QuestionQueryVo> wrapper = new QueryWrapper<>();

        Integer id = questionQueryVo.getId();
        String questionType = questionQueryVo.getQuestionType();
        String subjectId = questionQueryVo.getSubjectId();
        String subjectParentId = questionQueryVo.getSubjectParentId();

        if(id != null) {
            wrapper.eq("id", id);
        }

        if(!StringUtils.isEmpty(questionType)) {
            wrapper.eq("question_type", questionType);
        }

        if(!StringUtils.isEmpty(subjectId)) {
            wrapper.eq("subject_id", subjectId);
        }

        if(!StringUtils.isEmpty(subjectParentId)) {
            wrapper.eq("subject_parent_id", subjectParentId);
        }

        // 2. 创建mapper方法进行查询,
        Page<QuestionResultVo> page = new Page<>(current, size);

        List<QuestionResultVo> resultList = baseMapper.pageList(page, wrapper);

        page.setRecords(resultList);

        return page;
    }
}
