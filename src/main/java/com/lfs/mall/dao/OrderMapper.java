package com.lfs.mall.dao;

import com.lfs.mall.domain.Order;
import com.lfs.mall.domain.vo.OrderGVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMapper {
    void addOrder(Order order);

    Integer getMaxId();

    void updateOrder(Order order);

    void updateOrderStatus(Order order);

    void updateOrderStatusByOrderId(@Param(("orderId")) Integer orderId);

    List<Order> getOrder(Order order);

    List<Order> getOrderByUserId(@Param("userId") Integer userId);
    List<OrderGVO> getOrderByStatus(@Param("status") Integer status);

    List<OrderGVO> getOrderByUserIdGVO(Order order);
    Order getOrderById(@Param("id") Integer id);
}
