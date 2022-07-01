package com.atguigu.crud.entity;

import java.util.Date;
import java.io.Serializable;


public class MemberCard extends BaseBean implements Serializable {
    private static final long serialVersionUID = 948256186663429990L;
    
    private Integer id;
    /**
     * 会员id
     */
    private String msId;
    /**
     * 钱
     */
    private String money;
    /**
     * 会员卡号
     */
    private String cardNo;
    /**
     * 开卡时间
     */
    private String createTime;

    private String status;

    private String msName;

    public String getMsName() {
        return msName;
    }

    public void setMsName(String msName) {
        this.msName = msName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String type;

    private String ids;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

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

    public String getMsId() {
        return msId;
    }

    public void setMsId(String msId) {
        this.msId = msId;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

}

