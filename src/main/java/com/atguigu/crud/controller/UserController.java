package com.atguigu.crud.controller;


import com.atguigu.crud.entity.User;
import com.atguigu.crud.service.UserService;
import com.atguigu.crud.utils.pojo.AjaxResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

//摸鱼飞弹！0v0 0v0
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;


    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","user");
        return "user";
    }

    /**
     * 分页列表
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("list")
    public Object list(User e, HttpServletRequest request){
        PageHelper.startPage(e.getOffset(),e.getLimit());
        List<User> StuUsers = userService.findList(e);
        PageInfo pageInfo = new PageInfo(StuUsers);
        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @ResponseBody
    @RequestMapping("findAll")
    public AjaxResult findAll(User e){
        List<User> users = userService.findList(e);
        return AjaxResult.success(users);
    }

    /**
     * 修改/保存操作
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    public AjaxResult save(User e, HttpServletRequest request) {

        String id = e.getId();
        if ("".equals(id) || null == id) {
            e.setCreateTime(new Date());
            userService.insert(e);
        }else {
            userService.update(e);
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
    public AjaxResult delete(User e) {
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
        userService.deleteById(ids);
        return AjaxResult.success("操作成功");
    }
}
