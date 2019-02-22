package com.lfs.mall.dao;

import com.lfs.mall.domain.Order;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMapper {
    void addOrder(Order order);

    void updateOrder(Order order);

    List<Order> getOrder(Order order);
}
