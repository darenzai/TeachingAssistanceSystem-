package com.hujiayi.auxiliaryteach.ems.vo.api;

import lombok.Data;

import java.util.Date;

@Data
public class ScoreManageVo {

    private Integer number; // 测试或考试有效次数
    private Integer examScore; // 测试或考试得分
    private Date gmtCreate; // 提交时间
}
