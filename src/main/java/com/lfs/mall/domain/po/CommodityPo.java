package com.lfs.mall.domain.po;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class CommodityPo {
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
    private Date created;
    private Date updated;
}
