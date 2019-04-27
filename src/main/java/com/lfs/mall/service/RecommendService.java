package com.lfs.mall.service;

import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.OrderItemMapper;
import com.lfs.mall.dao.UserMapper;
import com.lfs.mall.domain.Commodity;
import com.lfs.mall.domain.RecmdReqVO;
import com.lfs.mall.domain.User;
import com.lfs.mall.domain.vo.EntryVO;
import com.lfs.mall.domain.vo.RecmdToCartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class RecommendService {

    private HttpSession session;
    private UserMapper userMapper;
    private OrderItemMapper orderItemMapper;
    private CommodityMapper commodityMapper;

    public List<RecmdToCartVo> getRecommendCommodityInCart() {
        List<RecmdToCartVo> ret = new ArrayList<>();
        if (session.getAttribute("cart") == null) {
            RecmdToCartVo recmdToCartVo = new RecmdToCartVo();
            recmdToCartVo.setRecommendList(getRecommendCommodity(8));
            recmdToCartVo.setRecommendReason("为您以下推荐商品");
            ret.add(recmdToCartVo);
        } else {
            Integer userId = -1;
            if (session.getAttribute("user") != null) {
                userId = ((User)session.getAttribute("user")).getId();
            }
            List<Commodity> cart = (List<Commodity>) session.getAttribute("cart");
            for (Commodity row : cart) {
                RecmdReqVO recmdReqVO = new RecmdReqVO();
                recmdReqVO.setCommodityId(row.getId());
                recmdReqVO.setUserId(userId);

                List<Commodity> recmd = userMapper.getRecmd(recmdReqVO);

                RecmdToCartVo recmdToCartVo = new RecmdToCartVo();
                recmdToCartVo.setRecommendReason("购买了"+row.getTitle()+"的用户也购买了下列商品");
                recmdToCartVo.setRecommendList(recmd);

                ret.add(recmdToCartVo);
            }
        }
        return ret;
    }

    public List<Commodity> getRecommendCommodity(int num) {
        List<Integer> commodityTop = orderItemMapper.getCommodityTop(num);

        List<Commodity> recommendCommidityList = new ArrayList<>();
        for (Integer i : commodityTop) {
            recommendCommidityList.add(commodityMapper.getCommodityById(i));
        }
        return recommendCommidityList;

    }


    public List<Commodity> getRecommendCommodityByUserId(int userId, int num) {
        List<User> userList = userMapper.getAllUser();
        List<Commodity> commodityList = commodityMapper.getAllCommodity();

        boolean[][] matrix = getMatrix(userList, commodityList);

        Map<Integer, Integer> userIndex = getUserId2Index(userList);
        Map<Integer, Integer> commodityIndex = getCommodity2Index(commodityList);

        int theUserIndex = userIndex.get(userId);

        List<Integer> similarUserList = getSimilarUser(matrix, num, theUserIndex);
        List<Integer> recommendCommodityIndex = getRecommendCommodityIndex(similarUserList, matrix, theUserIndex, num);

        List<Commodity> recommendCommidityList = new ArrayList<>();
        for (Integer i : recommendCommodityIndex) {
            recommendCommidityList.add(commodityList.get(i));
        }
        return recommendCommidityList;

    }


    private List<Integer> getRecommendCommodityIndex(List<Integer> similarUserList, boolean[][] mat, int theUserIndex, int num) {
        TreeSet<EntryVO> set = new TreeSet<>();
        for (int i = 0; i < mat[0].length; ++i) {
            int cnt = 0;
            for (int j = 0; j < mat.length; ++j) {
                cnt += (mat[j][i] ? 1 : 0);
            }
            set.add(new EntryVO(i, cnt));
        }
        List<Integer> res = new ArrayList<>();
        while (num-- > 0 && !set.isEmpty()) {
            Integer maxLike = set.pollLast().getId();
            if (!mat[theUserIndex][maxLike]) {
                res.add(maxLike);
            }
        }
        return res;

    }


    private List<Integer> getSimilarUser(boolean[][] mat, int num, int theUserIndex) {
        TreeSet<EntryVO> set = new TreeSet<>();
        for (int i = 0; i < mat.length; ++i) {
            if (theUserIndex == i) continue;
            int cnt = 0;
            for (int j = 0; j < mat[i].length; ++j) {
                cnt += (mat[theUserIndex][j] == mat[i][j] ? 1 : 0);
            }
            System.out.println(i + " user " + cnt);
            set.add(new EntryVO(i, cnt));
        }

        List<Integer> res = new ArrayList<>();
        while (num-- > 0 && !set.isEmpty()) {
            res.add(set.pollLast().getId());
            System.out.println(res.toArray().toString());
        }
        return res;
    }


    private boolean[][] getMatrix(List<User> userList, List<Commodity> commodityList) {

        boolean[][] res = new boolean[userList.size()][commodityList.size()];
        for (int i = 0; i < userList.size(); ++i) {
            User user = userList.get(i);
            Set<Integer> userCommodityIdList = orderItemMapper.getCommodityIdByUserId(user.getId());
            for (int j = 0; j < commodityList.size(); ++j) {
                Commodity commodity = commodityList.get(j);
                res[i][j] = userCommodityIdList.contains(commodity.getId());
            }
        }
        return res;
    }


    private Map<Integer, Integer> getUserId2Index(List<User> userList) {

        Map<Integer, Integer> map = new HashMap<>(userList.size());
        for (int i = 0; i < userList.size(); ++i) {
            map.put(userList.get(i).getId(), i);
        }
        return map;
    }

    private Map<Integer, Integer> getCommodity2Index(List<Commodity> commodityList) {
        Map<Integer, Integer> map = new HashMap<>(commodityList.size());
        for (int i = 0; i < commodityList.size(); ++i) {
            map.put(commodityList.get(i).getId(), i);
        }
        return map;
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
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
}
