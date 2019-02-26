package com.lfs.mall.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


import java.io.Serializable;
import java.util.Date;


/**
 * Author      : Fushen
 * Modified By :
 * Description : 用户PO
 *
 * Version 2019/2/14
 */
@Getter
@Setter
@ToString
public class User implements Serializable {

    private static final long serialVersionUID = 6226620577224214343L;

    private Integer id;

    private String username;


    private String password;

    private Boolean sex;

    private String email;

    private String phone;

    @JsonIgnore
    private Integer status;

    @JsonIgnore
    private Date created;

    @JsonIgnore
    private Date updated;

}
