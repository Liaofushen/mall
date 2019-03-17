package com.lfs.mall.util;

import com.lfs.mall.domain.Result;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 */
public class ResUtil {

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setStatus(0);
        result.setMessage("success");
        result.setData(data);
        return result;
    }

    public static Result success() {

        Result result = new Result();
        result.setStatus(0);
        result.setMessage("success");
        return result;
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setStatus(100);
        result.setMessage(msg);
        return result;
    }

    public static Result error() {
        return error("error");
    }


}
