package com.atguigu.crud.controller;


import com.atguigu.crud.entity.LoginUser;
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
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("admin")
public class InfoController {

    @Autowired
    UserService userService;

    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","info");
        return "info";
    }

    /**
     * 分页列表
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("list")
    public Object list(User e, HttpServletRequest request){
        HttpSession session = request.getSession();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        e.setId(loginUser.getUid());
        PageHelper.startPage(e.getOffset(),e.getLimit());
        List<User> users = userService.findList(e);
        PageInfo pageInfo = new PageInfo(users);
        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    
    /**
     * 修改/保存操作
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    public AjaxResult save(User e) {
        String id = e.getId();
        if ("".equals(id) || null == id) {
            userService.insert(e);
        }else {
            userService.update(e);
        }
        return AjaxResult.success("操作成功");
    }
    
}
