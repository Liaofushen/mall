package com.lfs.mall.dao;

import com.lfs.mall.domain.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ManagerMapper {
    List<Manager> getManagerByName(@Param("managerName") String managerName);
    List<Manager> getManager(Manager manager);
    void addManager(Manager manager);
    void updateManager(Manager manager);
}
