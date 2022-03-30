package com.hujiayi.auxiliaryteach.acl.service;


import com.hujiayi.auxiliaryteach.acl.entity.RolePermission;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 角色权限 服务类
 * </p>
 */
public interface RolePermissionService extends IService<RolePermission> {

    void deleteRolePermission(String id);
}
