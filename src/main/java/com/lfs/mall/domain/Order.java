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
 * Description : 订单
 *
 * @Version 2019/2/21
 */
@Setter
@Getter
@ToString
public class Order implements Serializable {
    private static final long serialVersionUID = -5772862315179148299L;
    private Integer id;
    private Integer userId;
    private Integer receiveAddrId;
    private BigInteger weightSum;
    private BigInteger priceSum;
    private Integer status;
    private Date created;
    private Date updated;
}
