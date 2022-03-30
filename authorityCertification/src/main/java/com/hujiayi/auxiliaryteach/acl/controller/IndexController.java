package com.hujiayi.auxiliaryteach.acl.controller;

import com.alibaba.fastjson.JSONObject;
import com.hujiayi.auxiliaryteach.acl.service.IndexService;
import com.hujiayi.auxiliaryteach.common.result.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/acl/index")
public class IndexController {

    @Autowired
    private IndexService indexService;

    /**
     * 根据token获取用户信息
     */
    @GetMapping("info")
    public R info(){
        //获取当前登录用户用户名
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<String, Object> userInfo = indexService.getUserInfo(username);
        return R.ok().put(userInfo);
    }

    /**
     * 获取菜单
     * @return
     */
    @GetMapping("menu")
    public R getMenu(){
        //获取当前登录用户用户名
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<JSONObject> permissionList = indexService.getMenu(username);
        return R.ok().put("permissionList", permissionList);
    }

    @PostMapping("logout")
    public R logout(){
        return R.ok();
    }

}
