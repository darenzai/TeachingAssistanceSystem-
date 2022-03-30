package com.hujiayi.auxiliaryteach.ems.mapper;

import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionResultVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
public interface PaperManageMapper extends BaseMapper<PaperManage> {

    List<QuestionResultVo> pageList(Page<QuestionResultVo> page, @Param(Constants.WRAPPER) QueryWrapper<QuestionQueryVo> wrapper);
}
