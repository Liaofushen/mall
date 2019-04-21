package com.lfs.mall.controller;

import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.OrderItemMapper;
import com.lfs.mall.dao.OrderMapper;
import com.lfs.mall.dao.ReceiveAddrMapper;
import com.lfs.mall.domain.Commodity;
import com.lfs.mall.domain.Order;
import com.lfs.mall.domain.Result;
import com.lfs.mall.domain.vo.OrderGVO;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 * @Version 2019/3/18
 */

@RestController
@RequestMapping("/manager")
public class MangerController {
    private OrderItemMapper orderItemMapper;
    private OrderMapper orderMapper;
    private CommodityMapper commodityMapper;
    private ReceiveAddrMapper receiveAddrMapper;

    @GetMapping("/order")
    public Result getOrder(@RequestParam("status") Integer status) {

        List<OrderGVO> orders = orderMapper.getOrderByStatus(status);
        for (OrderGVO orderGVO : orders) {
            orderGVO.setOrderItems(orderItemMapper.getOrderItemByOrderId(orderGVO.getId()));
        }
        return ResUtil.success(orders);

    }


    @PostMapping("/order/send/{orderId}")
    public Result fahuo(@PathVariable("orderId") Integer orderId) {
        Order order = new Order();
        order.setId(orderId);
        order.setStatus(2);
        try {

            orderMapper.updateOrderStatus(order);
            return ResUtil.success();
        } catch (Exception ex) {
            return ResUtil.error(ex.getMessage());
        }
    }

    @PostMapping("/order/cancel/{orderId}")
    public Result quxiao(@PathVariable("orderId") Integer orderId) {
        Order order = new Order();
        order.setId(orderId);
        order.setStatus(-1);
        try {

            orderMapper.updateOrderStatus(order);
            return ResUtil.success();
        } catch (Exception ex) {
            return ResUtil.error(ex.getMessage());
        }
    }

    @PostMapping("/commodity")
    public Result addCommodity(Commodity commodity) {
        System.out.println(commodity.toString());
        if (commodity.getTitle() == null || commodity.getPrice() == null || commodity.getNum() == null) {
            return ResUtil.error("title或price或num不能为空");
        }
        commodityMapper.addCommodity(commodity);
        return null;
    }




    @Autowired
    public void setOrderItemMapper(OrderItemMapper orderItemMapper) {
        this.orderItemMapper = orderItemMapper;
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setCommodityMapper(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    @Autowired
    public void setReceiveAddrMapper(ReceiveAddrMapper receiveAddrMapper) {
        this.receiveAddrMapper = receiveAddrMapper;
    }
}
