package com.hujiayi.auxiliaryteach.thirdparty;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@Slf4j
@ComponentScan("com.hujiayi")
@EnableDiscoveryClient
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class ThirdPartyApplication {

    public static void main(String[] args) {
        log.info("===================================系统，第三方服务模块正在启动===================================");
        SpringApplication.run(ThirdPartyApplication.class, args);
        log.info("===================================系统，第三方服务模块成功启动===================================");
    }

}
