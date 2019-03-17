package com.lfs.mall.dao;

import com.lfs.mall.domain.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

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
    List<OrderItem> getOrderItemByOrderId(@Param("orderId") Integer orderId);
    void addOrderItem(OrderItem orderItem);
    Set<Integer> getCommodityIdByUserId(@Param("userId") Integer userId);
    List<Integer> getCommodityTop(@Param("num")Integer num);
}
