package com.lfs.mall.dao;

import com.lfs.mall.domain.Keyword;
import com.lfs.mall.domain.vo.KeywordVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface KeywordMapper {
    List<Keyword> getKeyword();

    List<Keyword> getKeywordByCategoryId(@Param("categoryId") Integer categoryId);
    List<String> getKeywordName(@Param("categoryId") Integer categoryId);
}
