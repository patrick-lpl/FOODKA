package com.atguigu.crud.service;

import com.atguigu.crud.entity.MemberCard;
import com.atguigu.crud.exception.MyException;

import java.util.List;


public interface MemberCardService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    MemberCard queryById(Integer id);

    /**
     * 分页查询
     *
     * @param memberCard 筛选条件
     * @return 查询结果
     */
    List<MemberCard> findList(MemberCard memberCard);

    /**
     * 新增数据
     *
     * @param memberCard 实例对象
     * @return 实例对象
     */
    MemberCard insert(MemberCard memberCard);

    /**
     * 修改数据
     *
     * @param memberCard 实例对象
     * @return 实例对象
     */
    MemberCard update(MemberCard memberCard)  throws MyException;

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    void deleteByIds(String ids);

}
