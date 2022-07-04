package com.atguigu.crud.controller;


import com.atguigu.crud.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    DishService dishService;

    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","order");
        return "order";
    }
}
