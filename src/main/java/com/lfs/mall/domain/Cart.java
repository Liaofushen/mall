package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Setter
@Getter
@ToString
public class Cart {
    private static final long serialVersionUID = 7673842255759044428L;
    private Integer id;
    private Integer categoryId;
    private String title;
    private String sellPoint;
    private String desc;

    private BigDecimal price;
    private Integer num;
    private String barcode;
    private String image;
    private Integer status;
    private BigDecimal weight;
    private String colour;
    private String size;
}
