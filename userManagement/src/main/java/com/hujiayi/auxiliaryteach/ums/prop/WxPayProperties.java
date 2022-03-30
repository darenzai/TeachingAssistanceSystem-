package com.hujiayi.auxiliaryteach.ums.prop;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "wx.pay")
public class WxPayProperties {

    private String appid;
    private String partner;
    private String partnerkey;
    private String notifyurl;

}
