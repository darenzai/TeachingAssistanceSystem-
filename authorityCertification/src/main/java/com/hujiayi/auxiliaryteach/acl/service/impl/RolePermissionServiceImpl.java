package com.hujiayi.auxiliaryteach.acl.service.impl;

import com.hujiayi.auxiliaryteach.acl.entity.RolePermission;
import com.hujiayi.auxiliaryteach.acl.mapper.RolePermissionMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hujiayi.auxiliaryteach.acl.service.RolePermissionService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色权限 服务实现类
 * </p>
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements RolePermissionService {

    @Override
    public void deleteRolePermission(String id) {
        QueryWrapper<RolePermission> wrapper = new QueryWrapper<>();
        wrapper.eq("role_id", id);
        Integer count = this.baseMapper.selectCount(wrapper);
        if(count > 0) {
            this.baseMapper.delete(wrapper);
        }
    }
}
