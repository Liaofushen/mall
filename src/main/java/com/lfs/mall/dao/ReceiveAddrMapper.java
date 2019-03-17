package com.lfs.mall.dao;

import com.lfs.mall.domain.ReceiveAddr;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ReceiveAddrMapper {
    void addReceiveAddr(ReceiveAddr receiveAddr);
    void updateReceiveAddr(ReceiveAddr receiveAddr);
    List<ReceiveAddr> getByUserId(@Param("userId") Integer userId);
    ReceiveAddr getById(@Param("id") Integer userId);
}
