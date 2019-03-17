package com.lfs.mall.controller;

import com.lfs.mall.domain.OrderItem;
import com.lfs.mall.domain.ReceiveAddr;
import com.lfs.mall.domain.vo.OrderVO;
import com.lfs.mall.util.JsonUtil;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class OrderControllerTests {


    @Autowired
    private MockMvc mvc;

    private RequestBuilder request = null;


    @Test
    public void testPost() throws Exception {
        List<OrderItem> orderItems = new ArrayList<>();
        OrderItem orderItem = new OrderItem();
        orderItem.setCommodityId(2);
        orderItem.setCommodityNum(1);
        orderItems.add(orderItem);

        ReceiveAddr receiveAddr = new ReceiveAddr();
        receiveAddr.setId(0);

        OrderVO orderVO = new OrderVO();
        orderVO.setOrderItems(orderItems);
        orderVO.setReceiveAddr(receiveAddr);

        request = post("/order")
                .contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.toJsonString(orderVO));
        ResultActions perform = mvc.perform(request);
        System.out.println(perform.andReturn().getResponse().getContentAsString());
    }


}
