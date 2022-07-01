package com.atguigu.crud.service;

import com.atguigu.crud.entity.StuUser;

import java.util.List;

/**
 * 用户（学生）(StuUser)表服务接口
 *
 */
public interface StuUserService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    StuUser queryById(String id);

    /**
     * 新增数据
     *
     * @param stuUser 实例对象
     * @return 实例对象
     */
    StuUser insert(StuUser stuUser);

    /**
     * 修改数据
     *
     * @param stuUser 实例对象
     * @return 实例对象
     */
    StuUser update(StuUser stuUser);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String id);

    List<StuUser> findList(StuUser stuUser);

}
