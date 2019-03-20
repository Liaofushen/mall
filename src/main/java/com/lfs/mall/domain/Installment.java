package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class Installment {
    private Integer times;
    private BigDecimal sumPrice;
    private BigDecimal perPrice;
    private BigDecimal perInterest;
    private BigDecimal interestRate;

    public Installment(Integer times, BigDecimal perPrice, BigDecimal perInterest, BigDecimal interestRate) {
        this.times = times;
        this.perPrice = perPrice;
        this.perInterest = perInterest;
        this.interestRate = interestRate;
        this.sumPrice = perPrice.multiply(new BigDecimal(this.times.toString()));
    }
}
