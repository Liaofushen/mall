package com.lfs.mall;

import com.lfs.mall.dao.OrderItemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MallApplicationTests {
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Test
    public void contextLoads() {
        Set<Integer> set = orderItemMapper.getCommodityIdByUserId(1);
        for (Integer i : set) {
            System.out.println(i);
        }
    }

}


