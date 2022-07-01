package com.atguigu.crud.dao;

import com.atguigu.crud.entity.StuUser;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface StuUserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    StuUser queryById(String id);

    List<StuUser> findList(StuUser stuUser);

    /**
     * 新增数据
     *
     * @param stuUser 实例对象
     * @return 影响行数
     */
    int insert(StuUser stuUser);


    /**
     * 修改数据
     *
     * @param stuUser 实例对象
     * @return 影响行数
     */
    int update(StuUser stuUser);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String id);

}

