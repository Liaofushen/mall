package com.lfs.mall.util;

import lombok.Getter;
import lombok.Setter;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 * @Version 2019/2/20
 */
public class ResTool {

    public static <T> String success (T t) {
        Result<T> result = new Result<>();
        result.setStatus(0);
        result.setMsg("成功");
        result.setData(t);
        return JsonTool.toJsonString(result);
    }

    public static String success() {
        return success(null);
    }

    public static String error(String msg) {
        Result result = new Result();
        result.setStatus(0);
        result.setMsg(msg);
        return JsonTool.toJsonString(result);
    }

    public static String error() {
        return error(null);
    }

    @Getter
    @Setter
    private static class Result<T> {
        private Integer status;
        private String msg;
        private T data;
    }

}
