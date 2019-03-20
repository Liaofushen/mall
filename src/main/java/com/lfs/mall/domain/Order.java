package com.lfs.mall.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * Author      : Fushen
 * Modified By :
 * Description : 订单
 *
 * Version 2019/2/21
 */
@Setter
@Getter
@ToString
public class Order implements Serializable {
    private static final long serialVersionUID = -5772862315179148299L;
    private Integer id;
    private Integer userId;
    private Integer receiveAddrId;
    private BigDecimal weightSum;
    private BigDecimal priceSum;
    private Integer installment;
    private Integer installmentHavePaid;
    private Integer status;

    private List<OrderItem> orderItems;

    @JsonIgnore
    private Date created;
    @JsonIgnore
    private Date updated;
}
