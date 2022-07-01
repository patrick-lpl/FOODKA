package com.atguigu.crud.service.impl;

import java.util.List;
import com.atguigu.crud.entity.Member;
import com.atguigu.crud.dao.MemberDao;
import com.atguigu.crud.service.MemberService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Resource
    private MemberDao memberDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Member queryById(Integer id) {
        return this.memberDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @return 查询结果
     */
    @Override
    public List<Member> findList(Member member) {
        return this.memberDao.findList(member);
    }

    /**
     * 新增数据
     *
     * @param member 实例对象
     * @return 实例对象
     */
    @Override
    public Member insert(Member member) {
        this.memberDao.insert(member);
        return member;
    }

    /**
     * 修改数据
     *
     * @param member 实例对象
     * @return 实例对象
     */
    @Override
    public Member update(Member member) {
        this.memberDao.update(member);
        return this.queryById(member.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.memberDao.deleteById(id) > 0;
    }

    @Override
    public void deleteByIds(String ids) {
        String[] idArr = ids.split(",");
        for (String s : idArr) {
            this.memberDao.deleteById(Integer.valueOf(s));
        }
    }
}
