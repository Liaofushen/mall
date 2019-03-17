package com.lfs.mall.controller;

import com.lfs.mall.domain.Result;
import com.lfs.mall.domain.User;
import com.lfs.mall.service.UserService;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.logging.Logger;


/**
 * Author      :
 * Fushen
 * Modified By :
 * Description :
 * <p>
 * Version 2019/2/14
 */
@RestController
@RequestMapping("/user")
public class UserController {

    private static Logger logger = Logger.getLogger(UserController.class.toString());


    private UserService userService;

    private HttpSession session;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setSession(HttpSession session) {
        this.session = session;
    }

    @RequestMapping("/test")
    public Result test(@RequestBody User user) {
        return ResUtil.success(user);
    }

    @GetMapping("/")
    public Result curUser() {
        if (session.getAttribute("user") != null) {
            return ResUtil.success((User) session.getAttribute("user"));
        }
        return ResUtil.success();
    }

    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            return ResUtil.error("用户名或密码为空");
        }
        try {
            User userByUsername = userService.getUserByUsername(user.getUsername());
            if (user.getPassword().equals(userByUsername.getPassword())) {
                session.setAttribute("user", userByUsername);
                logger.info("用户登录：" + userByUsername.toString());
                return ResUtil.success(userByUsername);
            } else {
                return ResUtil.error("用户名或密码错误");

            }
        } catch (Exception ex) {
            return ResUtil.error("用户名或密码错误");
        }

    }

    @PostMapping("/logout")
    public Result logout() {
        try {
            session.removeAttribute("user");
        } catch (Exception ex) {
            return ResUtil.error();
        }
        return ResUtil.success();
    }

    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            return ResUtil.error("用户名或密码为空");
        }
        if (userService.hasUsername(user.getUsername())) {
            return ResUtil.error("该用户名已存在");
        }
        try {
            userService.addUser(user);
            user = userService.getUser(user);
            logger.info("[用户注册] " + user.toString());
            return ResUtil.success(user);
        } catch (Exception ex) {
            return ResUtil.error();
        }
    }


    @PostMapping("/update")
    public Result update(@RequestBody User user) {
        if (session.getAttribute("user") == null) {
            return ResUtil.error("请先登录");
        }

        User user1 = (User) session.getAttribute("user");
        if (user.getUsername() != null &&
                !user.getUsername().equals(user1.getUsername()) &&
                userService.hasUsername(user.getUsername())) {
            return ResUtil.error("该用户名已存在");
        }
        try {
            user.setId(((User) session.getAttribute("user")).getId());
            System.out.println(user.toString());
            userService.updateUser(user);
            user = userService.getUser(user);
            session.setAttribute("user", user);
            return ResUtil.success(user);
        } catch (Exception ex) {
            return ResUtil.error(ex.toString());
        }
    }


}
