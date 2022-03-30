package com.hujiayi.auxiliaryteach.acl.service;


import com.hujiayi.auxiliaryteach.acl.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 */
public interface UserService extends IService<User> {

    // 从数据库中取出用户信息
    User selectByUsername(String username);
}
