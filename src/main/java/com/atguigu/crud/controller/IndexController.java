package com.atguigu.crud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {


    /**
     * 跳转到登陆界面
     * @return
     */
    @RequestMapping(value = {"login",""})
    public String index(){
        return "login" ;
    }

    /**
     * 跳转到主界面
     * @return
     */
    @RequestMapping("toMain")
    public String toMain(){
        return "redirect:toHomePage";
    }

    /**
     * 跳转到主页
     * @param modelMap
     * @return
     */
    @RequestMapping("toHomePage")
    public String toHomePage(ModelMap modelMap){
        modelMap.put("page","homePage");
        return "homePage";
    }
}
