package com.hujiayi.auxiliaryteach.common.result;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * 统一结果处理
 */
@Data
public class R {

    private Integer code;
    private String msg;
    private boolean success;
    private Map<String, Object> data = new HashMap<String, Object>();

    private R() {}

    public static R ok() {
        R r = new R();
        r.setCode(CodeResult.SUCCESS);
        r.setMsg("成功");
        r.setSuccess(true);
        return r;
    }

    public static R error() {
        R r = new R();
        r.setCode(CodeResult.ERROR);
        r.setMsg("失败");
        r.setSuccess(false);
        return r;
    }

    public static R error(String msg) {
        R r = new R();
        r.setCode(CodeResult.ERROR);
        r.setMsg(msg);
        r.setSuccess(false);
        return r;
    }

    public R success(Boolean success){
        this.setSuccess(success);
        return this;
    }

    public R message(String message){
        this.setMsg(message);
        return this;
    }

    public R code(Integer code){
        this.setCode(code);
        return this;
    }

    public R put(String key, Object value) {
        this.data.put(key, value);
        return this;
    }

    public R put(Map<String, Object> map) {
//		this.setData(map);
        this.data.putAll(map);
        return this;
    }

}
