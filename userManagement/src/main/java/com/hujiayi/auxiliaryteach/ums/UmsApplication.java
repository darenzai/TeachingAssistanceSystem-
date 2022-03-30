package com.hujiayi.auxiliaryteach.ums;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;


@Slf4j
@EnableFeignClients
@EnableDiscoveryClient // 开启nacos
@ComponentScan("com.hujiayi")
@SpringBootApplication
public class UmsApplication {

    public static void main(String[] args) {
        log.info("===================================大数据学院教学辅助在线系统，用户管理模块正在启动===================================");
        SpringApplication.run(UmsApplication.class, args);
        log.info("===================================大数据学院教学辅助在线系统，用户管理模块成功启动===================================");
    }

}
