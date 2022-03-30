package com.hujiayi.auxiliaryteach.edu.mapper;

import com.hujiayi.auxiliaryteach.edu.entity.Subject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 课程科目 Mapper 接口
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface SubjectMapper extends BaseMapper<Subject> {

    public void deleteAllLeafNodeByParentId(String parentId);

}
