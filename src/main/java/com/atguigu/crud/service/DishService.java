package com.atguigu.crud.service;

import com.atguigu.crud.entity.Dish;

import java.util.List;

public interface DishService {
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Dish queryById(String id);

    /**
     * 新增数据
     *
     * @param dish 实例对象
     * @return 实例对象
     */
    Dish insert(Dish dish);

    /**
     * 修改数据
     *
     * @param dish 实例对象
     * @return 实例对象
     */
    Dish update(Dish dish);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String id);

    List<Dish> findList(Dish dish);

}
