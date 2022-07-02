package com.atguigu.crud.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Dish  extends BaseBean implements Serializable {
    // 菜品编号
    private String id;
    // 菜品名称
    private String name;
    // 菜品单价
    private Integer price;

}
