package com.hujiayi.auxiliaryteach.ems;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@Slf4j
@EnableFeignClients
@ComponentScan(value = {"com.hujiayi"})
@EnableDiscoveryClient
@SpringBootApplication
public class EmsApplication {

    public static void main(String[] args) {
        log.info("===================================大数据学院教学辅助在线系统，考试管理模块正在启动===================================");
        SpringApplication.run(EmsApplication.class, args);
        log.info("===================================大数据学院教学辅助在线系统，考试管理模块完成启动===================================");
    }

}
