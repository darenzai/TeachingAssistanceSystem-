package com.hujiayi.auxiliaryteach.common.exception;

import com.hujiayi.auxiliaryteach.common.result.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalException {

    /**
     * 全局异常
     */
    @ExceptionHandler(Exception.class)
    public R globalException(Exception e) {
        e.printStackTrace();
        return R.error(e.getMessage());
    }

    /**
     * 特定异常
     */

    @ExceptionHandler(ArithmeticException.class)
    public R givenException(ArithmeticException e) {
        e.printStackTrace();
        return R.error("特定异常...");
    }

    /**
     * 自定义异常
     */
    @ExceptionHandler(XliException.class)
    public R customException(XliException e) {
        return R.error().code(e.getCode()).message(e.getMsg());
    }

}
