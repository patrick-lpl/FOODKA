package com.atguigu.crud.controller;


import com.atguigu.crud.entity.Admin;
import com.atguigu.crud.entity.LoginUser;
import com.atguigu.crud.service.AdminService;
import com.atguigu.crud.utils.pojo.AjaxResult;
import com.atguigu.crud.utils.tools.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;

@Controller
public class AdminLoginController {


    @Autowired
    private AdminService adminService;

    /**
     * 管理员用户登录
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("adminLogin")
    public AjaxResult userLogin(HttpServletRequest request){

        // 用户名密码判断NULL
        String username = request.getParameter("username");
        if (StringUtils.isEmpty(username)) {
            return AjaxResult.error("用户名不能为空");
        }
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(password)) {
            return AjaxResult.error("密码不能为空");
        }

        // 创建一个"用户登陆"类实体
        LoginUser user = new LoginUser();
        // 创建一个"管理员"实体
        Admin adminParam = new Admin();
        // 将输入的用户名注入管理员实体的用户名属性
        user.setUsername(username);
        // jQuery的findList()方法返回userList
        List<Admin> admins = adminService.findList(adminParam);
        if (admins == null || admins.size() == 0) {
            return AjaxResult.error("用户名或密码错误");
        }
        // get(0):获取集合List的第一个元素
        Admin loginAdmin = admins.get(0);
        // 设置"用户登陆"类实体的类型为管理员
        user.setUserType("admin");
//        String encodeStr1 = Base64.getEncoder().encodeToString(username.getBytes());
//        if (!encodeStr1.equals(loginUser.getUsername())) { // equals函数循环判断users的List中的用户名是否匹配
//            return AjaxResult.error("用户名错误");
//        }
        String encodeStr = Base64.getEncoder().encodeToString(password.getBytes());
        // equals函数循环判断users的List中的密码是否匹配
        if (!encodeStr.equals(loginAdmin.getPassword())) {
            return AjaxResult.error("用户名或密码错误");
        }
        user.setUid(loginAdmin.getAdminId());
        user.setUsername(loginAdmin.getUsername());
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("loginUser",user);
        return AjaxResult.success(user);
    }


    /**
     * 退出
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession = request.getSession();
        LoginUser loginUser = (LoginUser) httpSession.getAttribute("loginUser");
        if(null == loginUser || "admin".equals(loginUser.getUserType())) {
            return "redirect:login";
        }
        httpSession.setAttribute("loginUser",null);
        return "redirect:user/toMemberLogin";
    }


    /**
     * 跳转修改密码
     * @param modelMap
     * @return
     */
    @RequestMapping("toRepwd")
    public String toRepwd(ModelMap modelMap) {
        modelMap.put("page","toRepwd");
        return "toRepwd";
    }

    /**
     * 修改密码
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("updateUserPwd")
    public AjaxResult updateUserPwd(HttpServletRequest  request) {
        String pwd = request.getParameter("pwd");
        String repwd = request.getParameter("repwd");

        if (StringUtils.isEmpty(pwd) || StringUtils.isEmpty(repwd)) {
            return AjaxResult.error("密码不能为空");
        }
        if (!repwd.equals(pwd)) {
            return AjaxResult.error("两次密码不一致");
        }

        HttpSession session = request.getSession();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

        Admin admin = new Admin();
        admin.setAdminId(loginUser.getUid());
        admin.setPassword(Base64.getEncoder().encodeToString(pwd.getBytes()));
        adminService.update(admin);
        return AjaxResult.success();

    }

}
