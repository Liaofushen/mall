package com.lfs.mall.dao;

import com.lfs.mall.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    List<User> getUser(User user);

    void addUser(User user);

    void updateUser(User user);
}
