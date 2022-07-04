package com.atguigu.crud.service.impl;

import java.util.List;
import com.atguigu.crud.entity.User;
import com.atguigu.crud.dao.UserDao;
import com.atguigu.crud.service.UserService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("memberService")
@Mapper
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public User queryById(Integer id) {
        return this.userDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @return 查询结果
     */
    @Override
    public List<User> findList(User user) {
        return this.userDao.findList(user);
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User insert(User user) {
        this.userDao.insert(user);
        return user;
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User update(User user) {
        this.userDao.update(user);
        return this.queryById(user.getUsId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.userDao.deleteById(id) > 0;
    }

    @Override
    public void deleteByIds(String ids) {
        String[] idArr = ids.split(",");
        for (String s : idArr) {
            this.userDao.deleteById(Integer.valueOf(s));
        }
    }
}
