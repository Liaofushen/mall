package com.lfs.mall.controller;


import com.lfs.mall.dao.CommentMapper;
import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.OrderMapper;
import com.lfs.mall.dao.UserMapper;
import com.lfs.mall.domain.*;
import com.lfs.mall.domain.vo.CommentVO;
import com.lfs.mall.service.RecommendService;
import com.lfs.mall.util.InstallmentUtil;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class CommodityController {

    private UserMapper userMapper;
    private CommodityMapper commodityMapper;
    private CommentMapper commentMapper;
    private OrderMapper orderMapper;
    private HttpSession session;
    private RecommendService recommendService;


    @GetMapping("/commodity/{id}")
    public Result geCommodity(@PathVariable Integer id) {
        Map<String, Object> ans = new HashMap<>();

        Commodity commodity = commodityMapper.getCommodityById(id);
        if (commodity == null) {
            return ResUtil.error("该商品ID不存在");
        }


        Installment[] installments = new Installment[]{
                InstallmentUtil.getInstallment(commodity.getPrice(), 3),
                InstallmentUtil.getInstallment(commodity.getPrice(), 6),
                InstallmentUtil.getInstallment(commodity.getPrice(), 12)
        };

        ans.put("commodity", commodity);
        ans.put("installment", installments);
        ans.put("comment", getComments(id));
        return ResUtil.success(ans);
    }

    @GetMapping("/commodity/recommend")
    public Result getRecommend() {
        if (session.getAttribute("user") == null) {
            return ResUtil.error("请先登录");
        }

        User user = (User) session.getAttribute("user");
        try {
            List<Commodity> commodityList = recommendService.getRecommendCommodityByUserId(user.getId(), 16);
            return ResUtil.success(commodityList);

        } catch (Exception ex) {
            return ResUtil.error(ex.toString());
        }
    }

    @PostMapping("/comment")
    public Result addComment(@RequestBody Comment comment) {
        if (session.getAttribute("user") == null) {
            return ResUtil.error("请先登录");
        }

        if (comment.getStarLevel() == null) {
            return ResUtil.error("starLevel为空");
        }
        if (comment.getStarLevel() < 0 || comment.getStarLevel() > 5) {
            return ResUtil.error("starLevel值必须是1~5");
        }
        if (comment.getCommodityId() == null) {
            return ResUtil.error("commodityId为空");
        }
        if (comment.getDesc() == null) {
            return ResUtil.error("desc为空");
        }

        User user = (User) session.getAttribute("user");
        try {
            comment.setUserId(user.getId());
            commentMapper.addComment(comment);
//            Order order = new Order();
//            order.setId(comment.ge);
//            orderMapper.updateOrderStatus();
            return ResUtil.success(comment);
        } catch (Exception ex) {
            return ResUtil.error(ex.getMessage());
        }
    }

    private Map<String, Object> getComments(Integer id) {
        List<CommentVO> comments = commentMapper.getCommentByCommodityIdVO(id);
        Map<String, Object> res = new HashMap<>();
        if (comments.size() > 0) {
            double sum = 0;
            for (CommentVO comment : comments) {
                sum += comment.getStarLevel();
                comment.setUser(userMapper.getUserByIdVO(comment.getId()));
            }

            res.put("avgStarLevel", String.format("%.2f", sum / comments.size()));
        }
        res.put("comments", comments);
        return res;
    }

    @Autowired
    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Autowired
    public void setCommodityMapper(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    @Autowired
    public void setSession(HttpSession session) {
        this.session = session;
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Autowired
    public void setRecommendService(RecommendService recommendService) {
        this.recommendService = recommendService;
    }
}
