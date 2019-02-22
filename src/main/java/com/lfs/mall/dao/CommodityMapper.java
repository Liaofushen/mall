package com.lfs.mall.dao;

import com.lfs.mall.domain.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommodityMapper {
    List<Commodity> getCommodity(Commodity commodity);

    void updateCommodity(Commodity commodity);

    void addCommodity(Commodity commodity);
}
