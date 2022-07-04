package com.atguigu.crud.service.impl;

import com.atguigu.crud.dao.OrderDao;
import com.atguigu.crud.entity.Order;
import com.atguigu.crud.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Order queryById(String id) {
        return this.orderMapper.queryById(id);
    }


    /**
     * 新增数据
     *
     * @param order 实例对象
     * @return 实例对象
     */
    @Override
    public Order insert(Order order) {
        this.orderMapper.insert(order);
        return order;
    }

    /**
     * 修改数据
     *
     * @param order 实例对象
     * @return 实例对象
     */
    @Override
    public Order update(Order order) {
        this.orderMapper.update(order);
        return this.queryById(order.getOrderId());
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
            this.orderMapper.deleteById(id);
        }
        return true;
    }

    @Override
    public List<Order> findList(Order order) {
        return this.orderMapper.findList(order);
    }

}
