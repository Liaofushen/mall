package com.lfs.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.lfs.mall.domain.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@ToString
public class CommentVO implements Serializable {


    private static final long serialVersionUID = 4510869431896767536L;
    private Integer id;
    private Integer orderId;
    private Integer commodityId;
    @JsonIgnore
    private Integer userId;
    private UserVO user;
    private String desc;
    private Integer starLevel;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date created;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updated;
}
