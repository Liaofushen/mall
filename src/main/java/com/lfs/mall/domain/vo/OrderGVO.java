package com.lfs.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lfs.mall.domain.OrderItem;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Setter
@Getter
@ToString
public class OrderGVO {
    private static final long serialVersionUID = -5772862315179148299L;
    private Integer id;
    private Integer userId;
    private BigDecimal weightSum;
    private BigDecimal priceSum;
    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date created;

    private List<OrderItem> orderItems;

}
