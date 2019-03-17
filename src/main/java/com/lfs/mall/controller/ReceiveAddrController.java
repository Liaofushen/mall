package com.lfs.mall.controller;

import com.lfs.mall.dao.ReceiveAddrMapper;
import com.lfs.mall.domain.ReceiveAddr;
import com.lfs.mall.domain.Result;
import com.lfs.mall.domain.User;
import com.lfs.mall.util.ResUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class ReceiveAddrController {
    private ReceiveAddrMapper receiveAddrMapper;
    private HttpSession session;

    @GetMapping("/receiveAddr")
    public Result getReceiveAddr() {
        if (session.getAttribute("user") == null) {
            ResUtil.error("请先登录");
        }
        try {
            User user = (User) session.getAttribute("user");
            return ResUtil.success(receiveAddrMapper.getByUserId(user.getId()));
        } catch (Exception ex) {
            return ResUtil.error();
        }
    }

    @GetMapping("/test/session")
    public void test() {
        System.out.println(session.getAttribute("user"));

    }

    @PostMapping("/receiveAddr")
    public Result addReceiceAddr(@RequestBody ReceiveAddr receiveAddr) {
        if (session.getAttribute("user") == null) {
            ResUtil.error("请先登录");
        }
        try {
            User user = (User) session.getAttribute("user");
            receiveAddr.setUserId(user.getId());

            System.out.println(receiveAddr);
            receiveAddrMapper.addReceiveAddr(receiveAddr);
            List<ReceiveAddr> receiveAddrs = receiveAddrMapper.getByUserId(receiveAddr.getUserId());
            return ResUtil.success(receiveAddrs);
        } catch (Exception ex) {
            return ResUtil.error();
        }
    }

    @Autowired
    public void setSession(HttpSession session) {
        this.session = session;
    }

    @Autowired
    public void setReceiveAddrMapper(ReceiveAddrMapper receiveAddrMapper) {
        this.receiveAddrMapper = receiveAddrMapper;
    }
}
