package com.hujiayi.auxiliaryteach.edu.controller;

import com.hujiayi.auxiliaryteach.common.result.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/edu/user")
public class BackstageLoginController {

    @PostMapping("login")
    public R login() {
        return R.ok().put("token", "admin");
    }

    @GetMapping("info")
    public R info() {
        return R.ok().put("roles", "Admin").put("data", "xueli");
    }

}
