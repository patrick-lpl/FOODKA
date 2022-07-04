package com.atguigu.crud.entity;


import lombok.Data;

import java.io.Serializable;

@Data
//@TableName("/order")
public class Order extends BaseBean implements Serializable {
//    @TableId("order_id")

    private String orderId;

    private Integer userId;

    private Integer total;

    private String creatTime;

}
