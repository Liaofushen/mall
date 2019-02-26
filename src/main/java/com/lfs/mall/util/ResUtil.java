package com.lfs.mall.util;

import com.lfs.mall.domain.Result;
import lombok.Getter;
import lombok.Setter;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 */
public class ResUtil {

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setStatus(0);
        result.setMessage("成功");
        result.setData(data);
        return result;
    }

    public static Result success() {
        return success(null);
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setStatus(0);
        result.setMessage(msg);
        return result;
    }

    public static Result error() {
        return error(null);
    }



}
