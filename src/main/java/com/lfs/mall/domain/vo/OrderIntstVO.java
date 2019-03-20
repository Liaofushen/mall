package com.lfs.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lfs.mall.domain.Installment;
import com.lfs.mall.domain.OrderItem;
import com.lfs.mall.domain.ReceiveAddr;
import com.lfs.mall.domain.User;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class OrderIntstVO {

    private static final long serialVersionUID = -5772862315179148299L;
    private Integer id;
    private Integer userId;
    private Integer receiveAddrId;
    private BigDecimal weightSum;
    private BigDecimal priceSum;
    private Integer status;
    private Integer installmentNum;
    private Integer installmentHavePaid;

    private Installment installment;

    private User user;
    private List<OrderItem> orderItems;
    private ReceiveAddr receiveAddr;

    @JsonIgnore
    private Date created;
    @JsonIgnore
    private Date updated;
}
