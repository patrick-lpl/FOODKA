package com.atguigu.crud.entity;


import lombok.Data;

import java.util.Date;
import java.io.Serializable;


//@TableName("/user")
@Data
public class User extends BaseBean implements Serializable {
//    @TableId("user_id")
    private static final long serialVersionUID = 742013590728887796L;

    private Integer usId;
    /**
     * 会员名称
     */
    private String usName;
    /**
     * 性别
     */
    private String usSex;
    /**
     * 年龄
     */
    private Integer usAge;
    /**
     * 手机号码
     */
    private String usPhone;
    /**
     * 注册时间
     */
    private String CreateTime;

    private String usPassword;

    private String ids;

}

