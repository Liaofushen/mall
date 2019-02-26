package com.lfs.mall.dao;

import com.lfs.mall.domain.Keyword;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface KeywordMapper {
    List<Keyword> getKeyword();
}
