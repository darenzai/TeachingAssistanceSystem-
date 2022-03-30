package com.hujiayi.auxiliaryteach.edu;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@Slf4j
@EnableFeignClients // 开启openfeign
@ComponentScan("com.hujiayi") // 扫描 Swagger 包。
@SpringBootApplication
@EnableDiscoveryClient
public class EduApplication {

    public static void main(String[] args) {
        log.info("===================================大数据学院教学辅助在线系统，edu管理模块正在启动===================================");
        SpringApplication.run(EduApplication.class, args);
        log.info("===================================大数据学院教学辅助在线系统，edu管理模块成功启动===================================");
    }

}
