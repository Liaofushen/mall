package com.lfs.mall.controller;

import com.lfs.mall.domain.Commodity;
import com.lfs.mall.util.JsonUtil;
import org.json.JSONObject;
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

import java.math.BigDecimal;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class MangerControllerTest {


    @Autowired
    private MockMvc mvc;

    private RequestBuilder request = null;

    @Test
    public void addCommodity() throws Exception {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("title", "test");
        jsonObject.put("sellPoint", "test");
        jsonObject.put("price", 1);
        jsonObject.put("num", 111);

        System.out.println(jsonObject.toString());


        request = post("/manager/commodity")
                .contentType(MediaType.APPLICATION_JSON)
                .content(jsonObject.toString());
        ResultActions perform = mvc.perform(request);
        System.out.println(perform.andReturn().getResponse().getContentAsString());
    }


}