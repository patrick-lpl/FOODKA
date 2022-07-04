package com.atguigu.crud.service.impl;

import com.atguigu.crud.entity.Admin;
import com.atguigu.crud.dao.AdminDao;
import com.atguigu.crud.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminDao userMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Admin queryById(String id) {
        return this.userMapper.queryById(id);
    }


    /**
     * 新增数据
     *
     * @param admin 实例对象
     * @return 实例对象
     */
    @Override
    public Admin insert(Admin admin) {
        this.userMapper.insert(admin);
        return admin;
    }

    /**
     * 修改数据
     *
     * @param admin 实例对象
     * @return 实例对象
     */
    @Override
    public Admin update(Admin admin) {
        this.userMapper.update(admin);
        return this.queryById(admin.getAdminId());
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
            this.userMapper.deleteById(id);
        }
        return true;
    }

    @Override
    public List<Admin> findList(Admin admin) {
        return this.userMapper.findList(admin);
    }
}
