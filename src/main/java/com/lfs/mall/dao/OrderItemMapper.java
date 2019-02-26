package com.lfs.mall.dao;

import com.lfs.mall.domain.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 * Version 2019/2/22
 */
@Mapper
@Repository
public interface OrderItemMapper {
    List<OrderItem> getOrderItem(OrderItem orderItem);
    void addOrderItem(OrderItem orderItem);
    void updateOrderItem(OrderItem orderItem);
}
