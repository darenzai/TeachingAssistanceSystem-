package com.hujiayi.auxiliaryteach.edu.service;

import com.hujiayi.auxiliaryteach.edu.entity.Statistics;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
public interface StatisticsService extends IService<Statistics> {

    void createStatisticsByDay(String day);

    Map<String, Map<String, Object>> getChartData(String begin, String end);
}
