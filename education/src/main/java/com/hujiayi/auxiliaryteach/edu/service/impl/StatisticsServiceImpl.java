package com.hujiayi.auxiliaryteach.edu.service.impl;

import com.hujiayi.auxiliaryteach.common.exception.XliException;
import com.hujiayi.auxiliaryteach.common.result.R;
import com.hujiayi.auxiliaryteach.edu.entity.Statistics;
import com.hujiayi.auxiliaryteach.edu.mapper.StatisticsMapper;
import com.hujiayi.auxiliaryteach.edu.service.StatisticsService;
import com.hujiayi.auxiliaryteach.edu.service.feign.MemberFeignService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务实现类
 * </p>
 *
 * @author andy
 * @since 2020-07-19
 */
@Service
public class StatisticsServiceImpl extends ServiceImpl<StatisticsMapper, Statistics> implements StatisticsService {

    @Autowired
    private MemberFeignService memberFeignService;

    @Override
    public void createStatisticsByDay(String day) {
        // 1. 验证数据
        if(StringUtils.isEmpty(day)) {
            throw new XliException(20001, "数据错误~");
        }

        // 2. 根据id查询数据
        QueryWrapper<Statistics> wrapper = new QueryWrapper<>();
        wrapper.eq("date_calculated", day);
        this.baseMapper.delete(wrapper);

        // 3. 生成统计记录
        R r = memberFeignService.countRegisterNum(day);
        Integer registerNum = (Integer)r.getData().get("registerNum");

        int loginNum = RandomUtils.nextInt(100, 200);
        int videoViewNum = RandomUtils.nextInt(100, 200);
        int courseNum = RandomUtils.nextInt(100, 200);

        //在本地数据库创建统计信息
        Statistics daily = new Statistics();

        daily.setRegisterNum(registerNum);
        daily.setLoginNum(loginNum);
        daily.setVideoViewNum(videoViewNum);
        daily.setCourseNum(courseNum);
        daily.setDateCalculated(day);

        baseMapper.insert(daily);
    }

    // 统计某个事件段的数据
    @Override
    public Map<String, Map<String, Object>> getChartData(String begin, String end) {

        Map<String, Map<String, Object>> map = new HashMap<>(16);

        Map<String, Object> registerNum = this.getChartDataByType(begin, end, "register_num");
        Map<String, Object> loginNum = this.getChartDataByType(begin, end, "login_num");
        Map<String, Object> videoViewNum = this.getChartDataByType(begin, end, "video_view_num");
        Map<String, Object> courseNum = this.getChartDataByType(begin, end, "course_num");

        map.put("registerNum", registerNum);
        map.put("loginNum", loginNum);
        map.put("videoViewNum", videoViewNum);
        map.put("courseNum", courseNum);

        return map;
    }

    private Map<String, Object> getChartDataByType(String begin, String end, String type) {

        Map<String, Object> map = new HashMap<>(16);

        ArrayList<String> xList = new ArrayList<>();//日期列表
        ArrayList<Integer> yList = new ArrayList<>();//数据列表

        // 1. 封装查询条件
        QueryWrapper<Statistics> wrapper = new QueryWrapper<>();
        wrapper.select(type, "date_calculated");
        wrapper.between("date_calculated", begin, end);
        List<Map<String, Object>> maps = this.baseMapper.selectMaps(wrapper);

        for (Map<String, Object> data : maps) {
            String dateCalculated = (String)data.get("date_calculated");
            xList.add(dateCalculated);
            Integer count = (Integer) data.get(type);
            yList.add(count);
        }

        map.put("xData", xList);
        map.put("yData", yList);
        return map;
    }
}
