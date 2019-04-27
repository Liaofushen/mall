package com.lfs.mall.controller;

import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.OrderItemMapper;
import com.lfs.mall.dao.OrderMapper;
import com.lfs.mall.dao.ReceiveAddrMapper;
import com.lfs.mall.domain.Order;
import com.lfs.mall.domain.Result;
import com.lfs.mall.domain.po.CommodityPo;
import com.lfs.mall.domain.vo.OrderGVO;
import com.lfs.mall.util.PicUtil;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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
    @Transactional(rollbackFor = Exception.class)
    public Result addCommodity(CommodityPo commodity,
                               @RequestParam(value = "commodity_img", required = false) MultipartFile multipartFile,
                               @RequestParam(value = "desc_img", required = false) List<MultipartFile> multipartFiles) {
//        System.out.println(commodity.toString());
        if (commodity.getTitle() == null || commodity.getPrice() == null || commodity.getNum() == null
        || commodity.getCategoryId() == null) {
            return ResUtil.error("title或price或num或categoryId不能为空");
        }

        String commodityImg = null;
        try {
            commodityImg = PicUtil.save(multipartFile);
        } catch (IOException e) {
            return ResUtil.error("commodity_img save error");
        }

        String descImgs = "";
        if (multipartFiles != null) {
            for (MultipartFile file : multipartFiles) {
                //System.out.println("file: "+file.getName());
                try {
                    descImgs = descImgs + PicUtil.save(file) + "\n";
                } catch (IOException e) {
                    return ResUtil.error("desc_img save error");
                }
            }
        }
        // System.out.println(commodityImg);
//        System.out.println(multipartFile.getName());

        commodity.setId(commodityMapper.getMaxId());
        commodity.setImage(commodityImg);
        commodity.setDesc(descImgs);
        commodity.setStatus(0);


        commodityMapper.addCommodity(commodity);
        return ResUtil.success(commodityMapper.getCommodityById(commodity.getId()));
    }

    @PostMapping("/test")
    public Result test(@RequestParam(value = "test", required = false) MultipartFile multipartFile) {
        if (multipartFile == null) return ResUtil.error("null multipartfile");
        System.out.println(multipartFile.getName());
        return ResUtil.success(multipartFile.getName());
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
