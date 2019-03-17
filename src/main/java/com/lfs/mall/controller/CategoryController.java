package com.lfs.mall.controller;

import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.KeywordMapper;
import com.lfs.mall.domain.Keyword;
import com.lfs.mall.domain.Result;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CategoryController {

    private CommodityMapper commodityMapper;
    private KeywordMapper keywordMapper;


    @GetMapping("/category")
    public Result getCategory(@RequestParam() String keyword) {
        return ResUtil.success(commodityMapper.getCommodityLikeName(keyword));
    }

    @GetMapping("/category/{categoryId}")
    public Result getCategory(@PathVariable("categoryId") Integer categoryId) {
        List<Keyword> keywordList = keywordMapper.getKeywordByCategoryId(categoryId);
        return ResUtil.success(keywordList);
    }

    @Autowired
    public void setCommodityMapper(CommodityMapper commodityMapper) {
        this.commodityMapper = commodityMapper;
    }

    @Autowired
    public void setKeywordMapper(KeywordMapper keywordMapper) {
        this.keywordMapper = keywordMapper;
    }
}
