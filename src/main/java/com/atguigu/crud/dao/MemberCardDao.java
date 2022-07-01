package com.atguigu.crud.dao;

import com.atguigu.crud.entity.MemberCard;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;


@Mapper
public interface MemberCardDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    MemberCard queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param memberCard 查询条件
     * @return 对象列表
     */
    List<MemberCard> findList(MemberCard memberCard);

    /**
     * 新增数据
     *
     * @param memberCard 实例对象
     * @return 影响行数
     */
    int insert(MemberCard memberCard);

    /**
     * 修改数据
     *
     * @param memberCard 实例对象
     * @return 影响行数
     */
    int update(MemberCard memberCard);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}

