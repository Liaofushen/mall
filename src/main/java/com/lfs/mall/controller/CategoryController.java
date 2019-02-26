package com.lfs.mall.controller;

import com.lfs.mall.dao.CategoryMapper;
import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.domain.Result;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;

@RestController
public class CategoryController {

    private CategoryMapper categoryMapper;
    private CommodityMapper commodityMapper;


    @GetMapping("/category")
    public Result getCategory(@RequestParam(required = false, defaultValue = "") String keyword) {
        if (StringUtils.isEmpty(keyword)) {
            return ResUtil.success(categoryMapper.getCategory());
        }
        System.out.println(keyword);
//        try {
//            keyword = new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        return ResUtil.success(commodityMapper.getCommodityLikeName(keyword));
    }

    @Autowired
    public void setCommodityMapper(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    @Autowired
    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }
}
