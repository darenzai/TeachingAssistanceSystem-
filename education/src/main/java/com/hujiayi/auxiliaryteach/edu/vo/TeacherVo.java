package com.hujiayi.auxiliaryteach.edu.vo;

import lombok.Data;

import java.util.Date;

/**
 * 为Teacher组合条件查询封装一个VO
 */
@Data
public class TeacherVo {

    private String name;

    private Integer level;

    private Date begin;

    private Date end;

}
