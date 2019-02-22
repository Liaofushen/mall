package com.lfs.mall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * Author      : Fushen
 * Modified By :
 * Description :收货地址
 *
 * @Version 2019/2/21
 */
@Setter
@Getter
@ToString
public class ReceiveAddr implements Serializable {

    private static final long serialVersionUID = -3922114350940169641L;
    private Integer id;
    private Integer userId;
    private String receiverName;
    private String phone;
    private String zipCode;
    private String province;
    private String city;
    private String county;
    private String addr;
    private Date created;
    private Date updated;
}
