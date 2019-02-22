package com.lfs.mall.controller;

import com.lfs.mall.domain.User;
import com.lfs.mall.service.UserService;
import com.lfs.mall.util.ResTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.logging.Logger;


/**
 * Author      :
 * Fushen
 * Modified By :
 * Description :
 *
 * @Version 2019/2/14
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

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            return ResTool.error("用户名或密码为空");
        }
        if (userService.hasUsername(user.getUsername()) &&
                userService.getUser(user).getPassword().equals(user.getPassword())) {
            user = userService.getUser(user);
            session.setAttribute(user.getUsername(), user);
            logger.info("用户登录：" + user.toString());
            return ResTool.success(user);
        } else {
            return ResTool.error("用户名或密码错误");
        }
    }

    @PostMapping("/logout")
    public void logout(@RequestBody User user) {
        if (!StringUtils.isEmpty(user.getUsername())) {
            session.removeAttribute(user.getUsername());
        }
    }

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
            return ResTool.error("用户名或密码为空");
        }
        if (userService.hasUsername(user.getUsername())) {
            return ResTool.error("该用户名已存在");
        }
        userService.addUser(user);
        logger.info("[用户注册] " + user.toString());
        return ResTool.success(user);
    }


}
