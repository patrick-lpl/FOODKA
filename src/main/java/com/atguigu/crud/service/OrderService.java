package com.atguigu.crud.service;

import com.atguigu.crud.entity.Dish;
import com.atguigu.crud.entity.Order;
import com.sun.tools.corba.se.idl.constExpr.Or;

import java.util.List;

public interface OrderService {
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Order queryById(String id);

    /**
     * 新增数据
     *
     * @param order 实例对象
     * @return 实例对象
     */
    Order insert(Order order);

    /**
     * 修改数据
     *
     * @param order  实例对象
     * @return 实例对象
     */
    Order update(Order order);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String id);

    List<Order> findList(Order order);
}
