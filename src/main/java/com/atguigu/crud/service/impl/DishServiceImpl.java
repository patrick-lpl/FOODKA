package com.atguigu.crud.service.impl;


import com.atguigu.crud.dao.DishDao;
import com.atguigu.crud.entity.Dish;
import com.atguigu.crud.service.DishService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DishServiceImpl implements DishService {

    @Resource
    private DishDao dishMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Dish queryById(String id) {
        return this.dishMapper.queryById(id);
    }


    /**
     * 新增数据
     *
     * @param dish 实例对象
     * @return 实例对象
     */
    @Override
    public Dish insert(Dish dish) {
        this.dishMapper.insert(dish);
        return dish;
    }

    /**
     * 修改数据
     *
     * @param dish 实例对象
     * @return 实例对象
     */
    @Override
    public Dish update(Dish dish) {
        this.dishMapper.update(dish);
        return this.queryById(dish.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String id) {
        String[] ids = id.split(",");
        for (String s : ids) {
            this.dishMapper.deleteById(id);
        }
        return true;
    }

    @Override
    public List<Dish> findList(Dish dish) {
        return this.dishMapper.findList(dish);
    }
}
