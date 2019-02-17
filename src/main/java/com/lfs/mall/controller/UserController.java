package com.lfs.mall.controller;

import com.lfs.mall.domain.User;
import com.lfs.mall.service.UserService;
import com.lfs.mall.util.JsonTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * Author      : Fushen
 * Modified By :
 * Description :
 *
 * @Version 2019/2/14
 */
@RestController
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/{id}")
    public String getOne(@PathVariable Integer id) {
        User user = new User();
        user.setId(id);
        List<User> res = userService.getUser(user);
        return JsonTool.toJsonString(res);
    }
}
