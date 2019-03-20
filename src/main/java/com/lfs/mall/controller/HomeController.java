package com.lfs.mall.controller;

import com.lfs.mall.dao.CategoryMapper;
import com.lfs.mall.dao.KeywordMapper;
import com.lfs.mall.domain.Category;
import com.lfs.mall.domain.Keyword;
import com.lfs.mall.domain.Result;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HomeController {


    private CategoryMapper categoryMapper;
    private KeywordMapper keywordMapper;

    private Map<String, Object> home = null;
    private Map<String, List<Keyword>> keyList = null;

    @GetMapping({"/home", "/index"})
    public Result getHome() {
        if (home == null) home = new HashMap<>();
        List<Category> category = categoryMapper.getCategory();
        for (Category c : category) {
            c.setKeywords(keywordMapper.getKeywordName(c.getId()));
        }
        home.put("category-list", category);
        home.put("slideshow-list", getSlideShow());
        home.put("keyword-list", getKeyShow());
        return ResUtil.success(home);
    }

    private String[] getSlideShow() {
        return new String[]{
                "http://www.liaofushen.xyz:8081/images/slideshow-1.jpg",
                "http://www.liaofushen.xyz:8081/images/slideshow-2.jpg",
                "http://www.liaofushen.xyz:8081/images/slideshow-3.jpg"};
    }

    private Map getKeyShow() {
        if (keyList == null) {
            keyList = new HashMap<>();
            List<Keyword> lists = keywordMapper.getKeyword();

            for (Keyword i : lists) {
                Category c = categoryMapper.getCategoryById(i.getCategoryId());
                if (!keyList.containsKey(c.getName()) && i.getCategoryId() <= 5) {
                    keyList.put(c.getName(), new ArrayList<>());
                }

                keyList.get(c.getName()).add(i);
            }
        }
        return keyList;
    }

    @Autowired
    public void setKeywordMapper(KeywordMapper keywordMapper) {
        this.keywordMapper = keywordMapper;
    }

    @Autowired
    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }
}
