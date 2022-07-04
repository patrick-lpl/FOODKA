package com.atguigu.crud.controller;

import com.atguigu.crud.entity.Dish;
import com.atguigu.crud.service.DishService;
import com.atguigu.crud.utils.pojo.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dish")
public class DishController {

    @Autowired
    DishService dishService;

    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","dish");
        return "dish";
    }

    /**
     * 修改/保存操作
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    public AjaxResult save(Dish e, HttpServletRequest request) {

        String id = e.getId();
        if ("".equals(id) || null == id) {
            dishService.insert(e);
        }else {
            dishService.update(e);
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
    public AjaxResult delete(Dish e) {
        String id = e.getId();
        if ("".equals(id) || null == id) {
            return AjaxResult.error("请选择需要删除的数据");
        }
        dishService.deleteById(id);
        return AjaxResult.success("操作成功");
    }
}
