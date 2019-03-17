package com.lfs.mall.controller;

import com.lfs.mall.dao.*;
import com.lfs.mall.domain.*;
import com.lfs.mall.domain.vo.OrderGVO;
import com.lfs.mall.domain.vo.OrderVO;
import com.lfs.mall.util.ResUtil;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class OrderController {
    private OrderItemMapper orderItemMapper;
    private OrderMapper orderMapper;
    private CommodityMapper commodityMapper;
    private HttpSession session;
    private ReceiveAddrMapper receiveAddrMapper;

    @PostMapping("/order")
    public Result addOrder(@RequestBody OrderVO orderVO) {
        if (session.getAttribute("user") == null) {
//            User user = new User();
//            user.setId(2);
//            user.setUsername("aa");
//            session.setAttribute("user", user);
            return ResUtil.error("请先登录");
        }
        try {
            orderVO.setId(orderMapper.getMaxId() + 1);
            orderVO.setUser((User) session.getAttribute("user"));
            orderVO.setUserId(orderVO.getUser().getId());
            orderVO.setReceiveAddrId(orderVO.getReceiveAddr().getId());
            orderVO.setReceiveAddr(receiveAddrMapper.getById(orderVO.getReceiveAddr().getId()));

            orderVO.setPriceSum(BigDecimal.ZERO);
            orderVO.setWeightSum(BigDecimal.ZERO);
            orderVO.setStatus(0);

            for (OrderItem i : orderVO.getOrderItems()) {
                Commodity commodity = commodityMapper.getCommodityById(i.getCommodityId());
                i.setCommodityId(commodity.getId());
                i.setCommodityTitle(commodity.getTitle());
                i.setCommodityPrice(commodity.getPrice());
                i.setCommodityWeight(commodity.getWeight());
                i.setCommodityTitle(commodity.getTitle());
                i.setCommodityImg(commodity.getImage());


                orderVO.setPriceSum(orderVO.getPriceSum().add(i.getCommodityPrice()));
                orderVO.setWeightSum(orderVO.getWeightSum().add(i.getCommodityWeight()));
            }
            Order order = new Order();
            order.setId(orderVO.getId());
            order.setUserId(orderVO.getUser().getId());
            order.setPriceSum(orderVO.getPriceSum());
            order.setWeightSum(orderVO.getWeightSum());
            order.setStatus(0);
            order.setReceiveAddrId(orderVO.getReceiveAddr().getId());

            orderMapper.addOrder(order);


            for (OrderItem i : orderVO.getOrderItems()) {
                i.setOrderId(order.getId());
                orderItemMapper.addOrderItem(i);
            }
            commodityMapper.consumeCommodityById(order.getId());
            if (session.getAttribute("cart") != null) {
                session.removeAttribute("cart");
            }

        } catch (Exception ex) {
            return ResUtil.error(ex.getMessage());
        }
        return ResUtil.success(orderVO);
    }

    @GetMapping("/pay/{orderId}")
    public Result getPay(@PathVariable() Integer orderId) {
        Map<String, String> res = new HashMap<>();

        res.put("pay-code", "http://www.liaofushen.xyz:8081/images/alipay.png");
        return ResUtil.success(res);
    }

    @PostMapping("/pay/{orderId}")
    public Result postPay(@PathVariable("orderId") Integer orderId, @RequestParam("result") Integer result) {
        if (result.equals(1)) {
            Order order = new Order();
            order.setId(orderId);
            order.setStatus(1);
            try {
                System.out.println(order.toString());
                orderMapper.updateOrderStatus(order);
                return ResUtil.success();
            } catch (Exception ex) {
                return ResUtil.error(ex.getMessage());
            }
        }
        return ResUtil.success();
    }



    @GetMapping("/order")
    public Result getOrder(@RequestParam(required = false) Integer status) {

//        User user = new User();
//        user.setId(2);

        if (session.getAttribute("user") == null) {
            return ResUtil.error("请先登录");
        }
        User user = (User) session.getAttribute("user");


        Order order = new Order();
        order.setUserId(user.getId());
        if (status != null) order.setStatus(status);
        try {
            List<OrderGVO> orders = orderMapper.getOrderByUserIdGVO(order);
            for (OrderGVO orderGVO : orders) {
                orderGVO.setOrderItems(orderItemMapper.getOrderItemByOrderId(orderGVO.getId()));
            }
            return ResUtil.success(orders);
        } catch (Exception ex) {
            return ResUtil.error(ex.getMessage());
        }
    }

    @PostMapping("/cart")
    public Result postCart(@RequestBody Commodity commodity) {
        if (commodity.getId() == null || commodity.getNum() == null) {
            return ResUtil.error("id和num不能为空");
        }
        try {
            Integer num = commodity.getNum();
            commodity = commodityMapper.getCommodityById(commodity.getId());
            commodity.setNum(num);

        } catch (Exception ex) {
            ResUtil.error("无此商品");
        }

        List<Commodity> commodities;
        if (session.getAttribute("cart") == null) {
            commodities = new ArrayList<>();
        } else {
            commodities = (List<Commodity>) session.getAttribute("cart");
        }

        boolean has = false;
        for (Commodity i : commodities) {
            if (i.getId().equals(commodity.getId())) {
                i.setNum(i.getNum() + 1);
                has = true;
                break;
            }
        }
        if (!has) commodities.add(commodity);
        session.setAttribute("cart", commodities);
        return ResUtil.success(commodities);
    }

    @GetMapping("/cart")
    public Result getCart() {
        if (session.getAttribute("cart") != null) {
            List<Commodity> commodities = (List<Commodity>) session.getAttribute("cart");
            return ResUtil.success(commodities);
        } else {
            return ResUtil.error("购物车无商品");
        }
    }

    @PutMapping("/cart")
    public Result putCart(@RequestBody Commodity commodity) {
        if (session.getAttribute("cart") == null) {
            return ResUtil.error("商品不存在");
        } else {
            List<Commodity> commodities = (List<Commodity>) session.getAttribute("cart");
            List<Commodity> res = new ArrayList<>();

            for (Commodity item : commodities) {
                if (item.getId().equals(commodity.getId())) {
                    item.setNum(commodity.getNum());
                }
                if (item.getNum() > 0) {
                    res.add(item);
                }
            }
            session.setAttribute("cart", res);
            return ResUtil.success(res);
        }

    }

    @DeleteMapping("/cart/{id}")
    public Result deleteCart(@PathVariable Integer id) {
        if (session.getAttribute("cart") == null) {
            return ResUtil.error("商品不存在");
        } else {
            List<Commodity> orderItems = (List<Commodity>) session.getAttribute("cart");
            List<Commodity> res = new ArrayList<>();
            for (Commodity item : orderItems) {
                if (!item.getId().equals(id)) {
                    res.add(item);
                }
            }
            session.setAttribute("cart", res);
            return ResUtil.success(res);
        }
    }


    @PostMapping("/order/cache")
    public void sessionOrder(@RequestBody OrderItem[] orderItems) {
        session.setAttribute("order", orderItems);
    }

    @GetMapping("/order/cache")
    public Result sessionOrder() {

        try {
            OrderItem[] orderItems = (OrderItem[]) session.getAttribute("order");
            session.removeAttribute("order");
            return ResUtil.success(orderItems);
        } catch (Exception ex) {
            return ResUtil.error("无订单数据");
        }
    }


    @Autowired
    public void setSession(HttpSession session) {
        this.session = session;
    }

    @Autowired
    public void setOrderItemMapper(OrderItemMapper orderItemMapper) {
        this.orderItemMapper = orderItemMapper;
    }


    @Autowired
    public void setCommodityMapper(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setReceiveAddrMapper(ReceiveAddrMapper receiveAddrMapper) {
        this.receiveAddrMapper = receiveAddrMapper;
    }


}
