package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * Author      : Fushen
 * Modified By :
 * Description : 商品
 *
 * @Version 2019/2/21
 */
@Getter
@Setter
@ToString
public class Commodity implements Serializable {
    private static final long serialVersionUID = 7673842255759044428L;
    private Integer id;
    private Integer categoryId;
    private String title;
    private String sellPoint;
    private String desc;
    private BigInteger price;
    private Integer num;
    private String barcode;
    private String image;
    private Integer status;
    private Integer weight;
    private String colour;
    private String size;
    private Date created;
    private Date updated;
}
