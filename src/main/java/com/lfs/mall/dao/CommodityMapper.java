package com.lfs.mall.dao;

import com.lfs.mall.domain.Commodity;
import com.lfs.mall.domain.po.CommodityPo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Mapper
@Repository
public interface CommodityMapper {
    List<Commodity> getAllCommodity();


    List<Commodity> getCommodity(Commodity commodity);

    List<Commodity> getCommodityByCategoryId(Integer categoryId);

    Commodity getCommodityById(@Param("id") Integer id);
//    CommodityVO getCommodityByIdVO(@Param("id") Integer id);

    List<Commodity> getCommodityLikeName(@Param("name") String name);

    void consumeCommodityById(@Param("id") Integer id);

    void updateCommodity(Commodity commodity);

    void addCommodity(CommodityPo commodity);
}
