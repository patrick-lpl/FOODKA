package com.atguigu.crud.service;

import com.atguigu.crud.entity.Member;
import java.util.List;


public interface MemberService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Member queryById(Integer id);

    /**
     * 分页查询
     *
     * @param member 筛选条件
     * @return 查询结果
     */
    List<Member> findList(Member member);

    /**
     * 新增数据
     *
     * @param member 实例对象
     * @return 实例对象
     */
    Member insert(Member member);

    /**
     * 修改数据
     *
     * @param member 实例对象
     * @return 实例对象
     */
    Member update(Member member);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    void deleteByIds(String ids);

}
