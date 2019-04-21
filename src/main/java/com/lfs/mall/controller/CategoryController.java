package com.lfs.mall.controller;

import com.lfs.mall.dao.CategoryMapper;
import com.lfs.mall.dao.CommodityMapper;
import com.lfs.mall.dao.KeywordMapper;
import com.lfs.mall.domain.Category;
import com.lfs.mall.domain.Commodity;
import com.lfs.mall.domain.Keyword;
import com.lfs.mall.domain.Result;
import com.lfs.mall.domain.vo.CategoryVo;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CategoryController {

    private CommodityMapper commodityMapper;
    private KeywordMapper keywordMapper;

    @GetMapping("/categoryList")
    public Result getAllCategory() {
        List<Category> categoryList = categoryMapper.getCategory();
        List<CategoryVo> resList = new ArrayList<>(categoryList.size());
        for (Category i : categoryList) {
            CategoryVo item = new CategoryVo();
            BeanUtils.copyProperties(i, item);
            resList.add(item);
        }
        return ResUtil.success(resList);
    }


    @GetMapping("/category")
    public Result getCategory(@RequestParam() String keyword) {
        return ResUtil.success(commodityMapper.getCommodityLikeName(keyword));
    }

    @GetMapping("/category/{categoryId}")
    public Result getCategory(@PathVariable("categoryId") Integer categoryId) {
        List<Keyword> keywordList = keywordMapper.getKeywordByCategoryId(categoryId);
        return ResUtil.success(keywordList);
    }

    @GetMapping("/category/{categoryId}/commodity")
    public Result getCommodity(@PathVariable("categoryId") Integer categoryId) {

        List<Commodity> commodityList = commodityMapper.getCommodityByCategoryId(categoryId);
        return  ResUtil.success(commodityList);
    }

    private CategoryMapper categoryMapper;

    @Autowired
    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
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
