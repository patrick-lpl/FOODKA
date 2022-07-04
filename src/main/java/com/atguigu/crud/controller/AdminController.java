package com.atguigu.crud.controller;


import com.atguigu.crud.entity.Admin;
import com.atguigu.crud.service.AdminService;
import com.atguigu.crud.utils.pojo.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


@RestController
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;


    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","admin");
        return "admin";
    }

    /**
     * 分页列表
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("list")
    public Object list(Admin e, HttpServletRequest request){
        PageHelper.startPage(e.getOffset(),e.getLimit());
        List<Admin> Admins = adminService.findList(e);
        PageInfo pageInfo = new PageInfo(Admins);
        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @ResponseBody
    @RequestMapping("findAll")
    public AjaxResult findAll(Admin e){
        List<Admin> admins = adminService.findList(e);
        return AjaxResult.success(admins);
    }

    /**
     * 修改/保存操作
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    public AjaxResult save(Admin e, HttpServletRequest request) {

        String id = e.getAdminId();
        if ("".equals(id) || null == id) {
            e.setCreateTime(new Date());
            adminService.insert(e);
        }else {
            adminService.update(e);
        }
        return AjaxResult.success("操作成功");
    }

    /**
     * 删除
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public AjaxResult delete(Admin e) {
        String ids = e.getIds();
        if ("".equals(ids) || null == ids) {
            return AjaxResult.error("请选择需要删除的数据");
        }
        String[] arr = ids.split(",");
        for (String s : arr) {
            if("1".equals(s)) {
                return AjaxResult.error("管理员用户不能删除");
            }
        }
        adminService.deleteById(ids);
        return AjaxResult.success("操作成功");
    }
}
