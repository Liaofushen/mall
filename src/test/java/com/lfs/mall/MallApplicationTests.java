package com.lfs.mall;

import com.lfs.mall.dao.OrderItemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MallApplicationTests {
    @Autowired
    private OrderItemMapper orderItemMapper;

    @Test
    public void contextLoads() {
        for (int i = 0; i < 5; i++)
            System.out.println(UUID.randomUUID());
    }

}


