package com.lfs.mall.util;

import com.lfs.mall.domain.Installment;

import java.math.BigDecimal;

public class InstallmentUtil {
    private static BigDecimal[] times = new BigDecimal[]{
            new BigDecimal("0"),
            new BigDecimal("2.3"),
            new BigDecimal("4.5"),
            new BigDecimal("5.8"),
            new BigDecimal("7.5")};

    public  static BigDecimal getAvgCost(BigDecimal price, int time) {
        BigDecimal rate = times[time/3].divide(new BigDecimal("100")).add(BigDecimal.ONE);
        BigDecimal sum = price.multiply(rate);
        BigDecimal ans = sum.divide(new BigDecimal(time), 2, BigDecimal.ROUND_CEILING);
        return ans;
    }

    public  static Installment getInstallment(BigDecimal price, int time) {
        BigDecimal rate = times[time/3].divide(new BigDecimal("100")).add(BigDecimal.ONE);
        BigDecimal sum = price.multiply(rate);

        BigDecimal perPrice = sum.divide(new BigDecimal(time), 2, BigDecimal.ROUND_CEILING);
        BigDecimal perInterest = sum.subtract(price).divide(new BigDecimal(time), 2, BigDecimal.ROUND_CEILING);

        return new Installment(time, perPrice, perInterest, times[time/3]);
    }

}
