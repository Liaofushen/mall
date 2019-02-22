package com.lfs.mall.constant;

public enum UserEnum {
    NORMAL(0),
    CANCELED(1),
    ;

    private Integer status;

    UserEnum(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }
}
