package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Keyword {
    private Integer id;

    private Integer categoryId;
    private String name;
    private String url;
    private String img;
}
