package com.hujiayi.auxiliaryteach.common.config;

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 整合 Swagger 接口文档
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    public Docket webApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("webApi")
                .apiInfo(webApiInfo())
                .select()
                .apis(RequestHandlerSelectors.any()) // 对所有api进行监控
                // 不显示错误的接口地址
                .paths(Predicates.not(PathSelectors.regex("/error.*"))) // 错误路径不监控
                .paths(PathSelectors.regex("/.*")) // 对根下所有路径进行监控
                .build();

    }

    private ApiInfo webApiInfo(){
        return new ApiInfoBuilder()
                .title("网站-课程中心API文档")
                .description("本文档描述了课程中心微服务接口定义")
                .version("1.0")
                .contact(new Contact("andy", "http://xliedu.com", "1650498553@qq.com"))
                .build();
    }

}
