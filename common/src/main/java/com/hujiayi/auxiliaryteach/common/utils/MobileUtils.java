package com.hujiayi.auxiliaryteach.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.util.regex.Pattern.*;

/**
 * 手机号验证工具类
 */
public class MobileUtils {

    /**
     * 手机号验证, 如果是true表示验证成功, 如果是false表示验证失败
     */
    public static boolean isMobile(String str) {
        // 验证手机号
        Pattern p = compile("^[1][3,4,5,7,8,9][0-9]{9}$");
        Matcher m = p.matcher(str);
        return m.matches();
    }

}
