package com.hujiayi.auxiliaryteach.ums.prop;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 初始化数据
 */
@Data
@Component
@ConfigurationProperties(prefix = "wx.open")
public class WxLoginProperties {
    private String appId;
    private String appSecret;
    private String redirectUri;
}
