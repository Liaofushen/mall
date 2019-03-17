package com.lfs.mall.service;

import com.lfs.mall.domain.Commodity;
import com.lfs.mall.domain.vo.EntryVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.EventListener;
import java.util.List;
import java.util.TreeSet;


@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class RecommendServiceTest {

    @Autowired
    private RecommendService recommendService;

    @Test
    public void getMatrix() {

    }

    @Test
    public void getRecommendCommodityIdByUserId() {
        List<Commodity> recommendCommodityIdByUserId = recommendService.getRecommendCommodityByUserId(1, 10);
        for (Commodity i : recommendCommodityIdByUserId) {
            System.out.println(i.getId());
        }

    }

    @Test
    public void getRecommendCommodityByUserIdTest() {
        boolean[][] matrix = new boolean[][] {
                {true, false, false, false, false},
                {false, true, true, false, false},//2
                {false, false, false, true, true},//2
                {false, false, false, true, true},//2
                {true, false, false, true, true}//3
        };
//        for (Integer i : recommendService.getSimilarUser(matrix, 2, 0)) {
//            System.out.println(i);
//        }


    }
    @Test
    public void teset() {
        TreeSet<EntryVO> set = new TreeSet<>();
        set.add(new EntryVO(1, 2));
        set.add(new EntryVO(2, 1));
        set.add(new EntryVO(3, 3));
        while (!set.isEmpty()) {
            System.out.println(set.pollLast());
        }


    }
}