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
 * Description : 商品评论
 *
 * Version 2019/2/21
 */
@Getter
@Setter
@ToString
public class Comment implements Serializable {
    private static final long serialVersionUID = 746304179728059445L;
    private Integer id;
    private Integer commodityId;
    private Integer userId;
    private String desc;
    private Integer starLevel;

    private Date created;

    private Date updated;
}
