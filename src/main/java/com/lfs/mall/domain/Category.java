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
 * Description : 目录
 *
 */
@Getter
@Setter
@ToString
public class Category implements Serializable {
    private static final long serialVersionUID = 4285311384817648391L;
    private Integer id;
    private String name;
    private Integer level;
    @JsonIgnore
    private Date created;
    @JsonIgnore
    private Date updated;
}
