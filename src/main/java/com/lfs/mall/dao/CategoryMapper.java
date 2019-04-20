package com.lfs.mall.dao;

import com.lfs.mall.domain.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Author      : Fushen
 * Modified By :
 * Description : 商品目录
 *
 */
@Mapper
    @Repository
public interface CategoryMapper {
    List<Category> getCategory();

    Category getCategoryById(Integer id);
}
