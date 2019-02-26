package com.lfs.mall.dao;

import com.lfs.mall.domain.Commodity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommodityMapper {
    List<Commodity> getCommodity(Commodity commodity);

    List<Commodity> getCommodityLikeName(@Param("name") String name);

    void updateCommodity(Commodity commodity);

    void addCommodity(Commodity commodity);
}
