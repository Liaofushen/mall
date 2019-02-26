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
 * Description : 管理员
 *
 */
@Getter
@Setter
@ToString
public class Manager implements Serializable {
    private static final long serialVersionUID = -8641089875116174053L;
    private Integer id;
    private String managerName;
    private String password;
    @JsonIgnore
    private Date created;
    @JsonIgnore
    private Date updated;
}
