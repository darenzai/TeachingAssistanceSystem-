package com.hujiayi.auxiliaryteach.gateway;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@Slf4j
@EnableDiscoveryClient
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class GatewayApplication {

    public static void main(String[] args) {
        log.info("===================================基于SpringBoot教学辅助系统，网关模块正在启动===================================");
        SpringApplication.run(GatewayApplication.class, args);
        log.info("===================================基于SpringBoot教学辅助系统，网关模块正在启动===================================");
    }

}
