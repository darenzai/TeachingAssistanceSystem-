package com.hujiayi.auxiliaryteach.edu.controller;


import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 前端控制器
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@RestController
@RequestMapping("/edu/statistics")
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    // 统计某天的数据
    @PostMapping("create/{day}")
    public R createStatisticsByDay(@PathVariable("day") String day) {
        statisticsService.createStatisticsByDay(day);
        return R.ok().message("数据统计生成成功");
    }

    // 获取某个时间段的数据
    @GetMapping("/get/chart/data/{begin}/{end}")
    public R getChartData(@PathVariable("begin") String begin, @PathVariable("end") String end) {
        Map<String, Map<String, Object>> map = statisticsService.getChartData(begin, end);
        return R.ok().put("chartData", map);
    }

}

