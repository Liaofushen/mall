package com.lfs.mall.domain.vo;

import com.lfs.mall.domain.Commodity;
import lombok.Data;

import java.util.List;

@Data
public class RecmdToCartVo {
    private String recommendReason;
    private List<Commodity> recommendList;
}
