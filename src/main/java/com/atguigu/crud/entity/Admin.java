package com.atguigu.crud.entity;


import lombok.Data;

import java.util.Date;
import java.io.Serializable;


//@TableName("/admin")
@Data
public class Admin extends BaseBean implements Serializable {
//    @TableId("admin_id")
    private static final long serialVersionUID = 550105771589852899L;

    /**
     * ID
     */
    private String adminId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;

    /**
     * 姓名
     */
    private String adminName;
    /**
     * 联系方式
     */
    private String adminPhone;
    /**
     * 邮箱
     */
    private String adminEmail;
    /**
     * 头像
     */
    private String photo;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;

    private String ids;
}

