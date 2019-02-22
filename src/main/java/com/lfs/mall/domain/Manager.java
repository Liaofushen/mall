package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * Author      : Fushen
 * Modified By :
 * Description : 管理员
 *
 * @Version 2019/2/22
 */
@Getter
@Setter
@ToString
public class Manager implements Serializable {
    private static final long serialVersionUID = -8641089875116174053L;
    private Integer id;
    private String managerName;
    private String password;
    private Date created;
    private Date updated;
}
