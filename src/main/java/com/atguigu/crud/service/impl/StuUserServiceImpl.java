package com.atguigu.crud.service.impl;

import com.atguigu.crud.entity.StuUser;
import com.atguigu.crud.dao.StuUserDao;
import com.atguigu.crud.service.StuUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("stuUserService")
public class StuUserServiceImpl implements StuUserService {

    @Resource
    private StuUserDao stuUserMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public StuUser queryById(String id) {
        return this.stuUserMapper.queryById(id);
    }


    /**
     * 新增数据
     *
     * @param stuUser 实例对象
     * @return 实例对象
     */
    @Override
    public StuUser insert(StuUser stuUser) {
        this.stuUserMapper.insert(stuUser);
        return stuUser;
    }

    /**
     * 修改数据
     *
     * @param stuUser 实例对象
     * @return 实例对象
     */
    @Override
    public StuUser update(StuUser stuUser) {
        this.stuUserMapper.update(stuUser);
        return this.queryById(stuUser.getId());
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
            this.stuUserMapper.deleteById(id);
        }
        return true;
    }

    @Override
    public List<StuUser> findList(StuUser stuUser) {
        return this.stuUserMapper.findList(stuUser);
    }
}
