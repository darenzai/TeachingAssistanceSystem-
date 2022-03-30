package com.hujiayi.auxiliaryteach.ums.vo;

import lombok.Data;

/**
 * 注册的vo, 前台传入数据
 */
@Data
public class RegisterVo {

    private String nickname;
    private String mobile;
    private String password;
    private String code;

}
