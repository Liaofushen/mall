package com.lfs.mall.dao;

import com.lfs.mall.domain.ReceiveAddr;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ReceiveAddrMapper {
    void addReceiveAddr(ReceiveAddr receiveAddr);
    void updateReceiveAddr(ReceiveAddr receiveAddr);
}
