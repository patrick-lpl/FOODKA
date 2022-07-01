package com.atguigu.crud.entity;

import java.util.Date;
import java.io.Serializable;


public class Member  extends BaseBean implements Serializable {
    private static final long serialVersionUID = 742013590728887796L;
    
    private Integer id;
    /**
     * 会员名称
     */
    private String msName;
    /**
     * 性别
     */
    private String sex;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 注册时间
     */
    private String createTime;

    private String cardFlag;

    private String password;

    private String point;

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCardFlag() {
        return cardFlag;
    }

    public void setCardFlag(String cardFlag) {
        this.cardFlag = cardFlag;
    }

    private String ids;

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsName() {
        return msName;
    }

    public void setMsName(String msName) {
        this.msName = msName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

}

