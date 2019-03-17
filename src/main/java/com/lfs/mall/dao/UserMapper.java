package com.lfs.mall.dao;

import com.lfs.mall.domain.User;
import com.lfs.mall.domain.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    List<User> getAllUser();
    List<User> getUser(User user);
    User getUserById(@Param("id") Integer id);
    UserVO getUserByIdVO(@Param("id") Integer id);

    void addUser(User user);

    void updateUser(User user);
}
