package com.lfs.mall.service;

import com.lfs.mall.domain.User;
import com.lfs.mall.dao.UserMapper;
import com.lfs.mall.constant.UserEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User getUser(User user) {
        return userMapper.getUser(user).get(0);
    }
    public User getUserByid(int id) {
        User user = new User();
        user.setId(id);
        return userMapper.getUser(user).get(0);
    }

    public User getUserByUsername(String username) {
        User user = new User();
        user.setUsername(username);
        return userMapper.getUser(user).get(0);
    }

    public boolean hasUsername(String username) {
        User user = new User();
        user.setUsername(username);
        return userMapper.getUser(user).size() > 0;
    }

    public List<User> getUsers(User user) {
        return userMapper.getUser(user);
    }

    public void addUser(User user) {
        userMapper.addUser(user);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public void deleteUser(int id) {
        User user = new User();
        user.setId(id);
        user.setStatus(UserEnum.CANCELED.getStatus());
        userMapper.updateUser(user);
    }

}
