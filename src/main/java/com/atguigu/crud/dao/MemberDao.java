package com.atguigu.crud.dao;

import com.atguigu.crud.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;


@Mapper
public interface MemberDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Member queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param member 查询条件
     * @return 对象列表
     */
    List<Member> findList(Member member);

    /**
     * 新增数据
     *
     * @param member 实例对象
     * @return 影响行数
     */
    int insert(Member member);

    /**
     * 修改数据
     *
     * @param member 实例对象
     * @return 影响行数
     */
    int update(Member member);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}

