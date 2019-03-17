package com.lfs.mall.dao;

import com.lfs.mall.domain.Comment;
import com.lfs.mall.domain.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CommentMapper {

    List<Comment> getCommentByCommodityId(@Param("commodityId") Integer commodityId);
    List<CommentVO> getCommentByCommodityIdVO(@Param("commodityId") Integer commodityId);

    void addComment(Comment comment);

    void deleteById(@Param("id") Integer id);
}
