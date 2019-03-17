package com.lfs.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
@ToString
public class UserVO implements Serializable {

    private Integer id;

    private String headImg;

    private String username;


    private Boolean sex;

    private String email;

    private String phone;



}
