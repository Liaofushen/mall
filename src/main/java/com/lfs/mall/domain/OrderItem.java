package com.lfs.mall.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * Author      : Fushen
 * Modified By :
 * Description : 订单项目
 *
 * Version 2019/2/22
 */
@Getter
@Setter
@ToString
public class OrderItem implements Serializable {
    private static final long serialVersionUID = 8338583698155063491L;
    private Integer id;
    private Integer orderId;
    private Integer commodityId;
    private Integer commodityTitle;
    private BigInteger commodityPrice;
    private BigInteger commodityWeight;
    @JsonIgnore
    private Date created;
    @JsonIgnore
    private Date updated;
}
