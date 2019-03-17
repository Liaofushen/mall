package com.lfs.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Setter
@Getter
@ToString
public class CommodityVO implements Serializable {

    private static final long serialVersionUID = 3533158949863514137L;

    private Integer id;

    private String title;

    private String url;

    private BigDecimal price;

    private String image;
    @JsonIgnore
    private Date created;
}
