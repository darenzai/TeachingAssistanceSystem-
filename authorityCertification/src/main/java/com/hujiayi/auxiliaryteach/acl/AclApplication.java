package com.hujiayi.auxiliaryteach.acl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@Slf4j
@EnableDiscoveryClient
@ComponentScan("com.hujiayi")
@SpringBootApplication
public class AclApplication {

    public static void main(String[] args) {
        log.info("===================================大数据学院教学辅助在线系统，acl管理模块正在启动===================================");
        SpringApplication.run(AclApplication.class, args);
        log.info("===================================大数据学院教学辅助在线系统，acl管理模块正在启动===================================");
    }
}
