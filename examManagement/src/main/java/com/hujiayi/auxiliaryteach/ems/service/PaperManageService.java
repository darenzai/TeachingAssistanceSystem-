package com.hujiayi.auxiliaryteach.ems.service;

import com.hujiayi.auxiliaryteach.ems.entity.PaperManage;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionQueryVo;
import com.hujiayi.auxiliaryteach.ems.vo.QuestionResultVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author andy
 * @since 2020-08-06
 */
public interface PaperManageService extends IService<PaperManage> {

    IPage<QuestionResultVo> pageList(QuestionQueryVo questionQueryVo, Long current, Long size);
}
