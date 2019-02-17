package com.lfs.mall.service;

import com.lfs.mall.domain.User;
import com.lfs.mall.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<User> getUser(User user) {
        return userMapper.getUser(user);
    }
}
