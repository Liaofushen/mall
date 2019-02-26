package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Result<T> {
    private Integer status;
    private String message;
    private T data;
}
