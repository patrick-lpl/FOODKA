package com.atguigu.crud.controller;


import com.atguigu.crud.entity.*;
import com.atguigu.crud.service.UserService;
import com.atguigu.crud.utils.pojo.AjaxResult;
import com.atguigu.crud.utils.tools.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


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

    // 我的会员卡
//    @RequestMapping("toMyMemberCard")
//    public String toMyMemberCard(ModelMap modelMap){
//        modelMap.put("page","myMemberCard");
//        return "member/myMemberCard";
//    }

//    // 我的订单
//    @RequestMapping("toMyOrder")
//    public String toMyOrder(ModelMap modelMap){
//        modelMap.put("page","myOrder");
//        return "member/myOrder";
//    }


//    // 会员卡日志
//    @RequestMapping("toMyCardLog")
//    public String toMyCardLog(ModelMap modelMap){
//        modelMap.put("page","myCardLog");
//        return "member/myCardLog";
//    }
//
//    // 日志
//    @RequestMapping("toMyPointLog")
//    public String toMyPointLog(ModelMap modelMap){
//        modelMap.put("page","myPointLog");
//        return "member/myPointLog";
//    }

    // 修改密码
    @RequestMapping("toMyRePassword")
    public String toMyRePassword(ModelMap modelMap){
        modelMap.put("page","myRePassword");
        return "member/myRePassword";
    }


    // 个人信息
    @RequestMapping("toMyInfo")
    public String toMyInfo(ModelMap modelMap){
        modelMap.put("page","myInfo");
        return "member/myInfo";
    }
//    // 个人信息
//    @RequestMapping("toMyPointExchange")
//    public String toMyPointExchange(ModelMap modelMap){
//        modelMap.put("page","myPointExchange");
//        return "member/myPointExchange";
//    }

    // 积分兑换
//    @RequestMapping("toMyPointExchangeDef")
//    public String toMyPointExchangeDef(ModelMap modelMap,HttpServletRequest request){
//        LoginUser loginUser = (LoginUser) request.getSession().getAttribute("loginUser");
//        if (loginUser != null && "user".equals(loginUser.getUserType())){
//            String uid = loginUser.getUid();
//            Member member = new Member();
//            member.setId(Integer.parseInt(uid));
//            List<Member> memberList = memberService.findList(member);
//            String point = memberList.get(0).getPoint();
//            modelMap.put("point",point == null? 0 : point);
//        }
//        modelMap.put("page","myPointExchangeDef");
//        return "member/myPointExchangeDef";
//    }

    /**
     * 分页列表
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("list")
    public Object list(User e, HttpServletRequest request){
        PageHelper.startPage(e.getOffset(),e.getLimit());
        HttpSession httpSession = request.getSession();
        LoginUser loginUser = (LoginUser) httpSession.getAttribute("loginUser");
        if (loginUser != null && "user".equals(loginUser.getUserType())) {
            e.setUsId(Integer.parseInt(loginUser.getUid()));
        }
        List<User> users = userService.findList(e);
        PageInfo pageInfo = new PageInfo(users);
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
        if (null == e.getUsId()) {
            User queryMemeberParam = new User();
            queryMemeberParam.setUsPhone(e.getUsPhone());
            List<User> users = userService.findList(queryMemeberParam);
            if (users != null && users.size() != 0) {
                return AjaxResult.error("当前手机号码已经被注册");
            }
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
        userService.deleteByIds(ids);
        return AjaxResult.success("操作成功");
    }

    /**
     * 通过手机号查询用户
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/findUserInfoByPhone")
    public AjaxResult findMemberInfoByPhone(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        if(StringUtils.isEmpty(phone)) {
            return AjaxResult.error("手机号码不能为空");
        }
        User user = new User();
        user.setUsPhone(phone);
        List<User> userList = userService.findList(user);
        if (userList == null || userList.size() == 0) {
            return AjaxResult.success(null);
        }
        return AjaxResult.success(userList.get(0));
    }

    /**
     * 用户登录
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("userLogin")
    public AjaxResult memberLogin(HttpServletRequest request){

        String username = request.getParameter("username");
        if (StringUtils.isEmpty(username)) {
            return AjaxResult.error("用户名不能为空");
        }
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(password)) {
            return AjaxResult.error("密码不能为空");
        }

        LoginUser user = new LoginUser();
        User userParam = new User();
        userParam.setUsPhone(username); // 将手机作为用户名登陆
        List<User> users = userService.findList(userParam);
        if (users == null || users.size() == 0) {
            return AjaxResult.error("用户名或密码错误");
        }
        User loginUser = users.get(0);
        user.setUserType("user");
        String encodeStr = Base64.getEncoder().encodeToString(password.getBytes());
        if (!encodeStr.equals(loginUser.getUsPassword())) { // equals函数循环判断users的List中的密码是否匹配
            return AjaxResult.error("用户名或密码错误");
        }
//        String encodeStr1 = Base64.getEncoder().encodeToString(username.getBytes());
//        if (!encodeStr1.equals(loginUser.getPhone())) { // equals函数循环判断users的List中的用户名是否匹配
//            return AjaxResult.error("用户名错误");
//        }
        user.setUid(loginUser.getUsId().toString());
        user.setUsername(loginUser.getUsName());
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("loginUser",user);
        return AjaxResult.success(user);
    }

    /**
     * 会员注册
     * @param
     * @return
     */
    @RequestMapping("toMemberRegister")
    public String toMemberRegister(){
        return "member/memberRegister";
    }

    /**
     * 会员登录
     * @param
     * @return
     */
    @RequestMapping("toMemberLogin")
    public String toMemberLogin(){
        return "member/memberLogin";
    }

    /**
     * 用户注册
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("memberRegister")
    public AjaxResult memberRegister(HttpServletRequest request){
        String username = request.getParameter("msName");
        if (StringUtils.isEmpty(username)) {
            return AjaxResult.error("会员名称不能为空");
        }
        String phone = request.getParameter("phone");
        if (StringUtils.isEmpty(phone)) {
            return AjaxResult.error("手机号码不能为空");
        }
        String password = request.getParameter("password");
        if (StringUtils.isEmpty(phone)) {
            return AjaxResult.error("密码不能为空");
        }

        String sex = request.getParameter("sex");
        User queryMemeberParam = new User();
        queryMemeberParam.setUsPhone(phone);
        List<User> users = userService.findList(queryMemeberParam);
        if (users != null && users.size() != 0) {
            return AjaxResult.error("当前手机号码已经被注册");
        }
        String ageStr = request.getParameter("age");
        Integer age = null;
        if (!StringUtils.isEmpty(ageStr)) {
            age = Integer.valueOf(ageStr);
        }
        User user = new User();
        user.setUsPhone(phone);
        user.setUsName(username);
        user.setUsPassword(password);
        user.setUsSex(sex);
        user.setUsPassword(Base64.getEncoder().encodeToString(password.getBytes()));
        user.setUsAge(age);
        userService.insert(user);


        return AjaxResult.success("注册成功");
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
        User user = new User();
        user.setUsId(Integer.parseInt(loginUser.getUid()));
        user.setUsPassword(Base64.getEncoder().encodeToString(pwd.getBytes()));
        userService.update(user);
        return AjaxResult.success();
    }

}
