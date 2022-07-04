package com.atguigu.crud.dao;


import com.atguigu.crud.entity.Dish;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DishDao {
    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Dish queryById(String id);

    List<Dish> findList(Dish dish);

    /**
     * 新增数据
     *
     * @param dish 实例对象
     * @return 影响行数
     */
    int insert(Dish dish);


    /**
     * 修改数据
     *
     * @param dish 实例对象
     * @return 影响行数
     */
    int update(Dish dish);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String id);

}
