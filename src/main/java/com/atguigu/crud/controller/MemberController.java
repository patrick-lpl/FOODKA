package com.atguigu.crud.controller;


import com.atguigu.crud.entity.*;
import com.atguigu.crud.service.MemberCardService;
import com.atguigu.crud.service.MemberService;
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
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService memberService;


    @RequestMapping("toList")
    public String toList(ModelMap modelMap){
        modelMap.put("page","member");
        return "member";
    }

    // 我的会员卡
    @RequestMapping("toMyMemberCard")
    public String toMyMemberCard(ModelMap modelMap){
        modelMap.put("page","myMemberCard");
        return "member/myMemberCard";
    }

    // 我的订单
    @RequestMapping("toMyOrder")
    public String toMyOrder(ModelMap modelMap){
        modelMap.put("page","myOrder");
        return "member/myOrder";
    }


    // 会员卡日志
    @RequestMapping("toMyCardLog")
    public String toMyCardLog(ModelMap modelMap){
        modelMap.put("page","myCardLog");
        return "member/myCardLog";
    }

    // 日志
    @RequestMapping("toMyPointLog")
    public String toMyPointLog(ModelMap modelMap){
        modelMap.put("page","myPointLog");
        return "member/myPointLog";
    }

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
    // 个人信息
    @RequestMapping("toMyPointExchange")
    public String toMyPointExchange(ModelMap modelMap){
        modelMap.put("page","myPointExchange");
        return "member/myPointExchange";
    }

    // 积分兑换
    @RequestMapping("toMyPointExchangeDef")
    public String toMyPointExchangeDef(ModelMap modelMap,HttpServletRequest request){
        LoginUser loginUser = (LoginUser) request.getSession().getAttribute("loginUser");
        if (loginUser != null && "user".equals(loginUser.getUserType())){
            String uid = loginUser.getUid();
            Member member = new Member();
            member.setId(Integer.parseInt(uid));
            List<Member> memberList = memberService.findList(member);
            String point = memberList.get(0).getPoint();
            modelMap.put("point",point == null? 0 : point);
        }
        modelMap.put("page","myPointExchangeDef");
        return "member/myPointExchangeDef";
    }

    /**
     * 分页列表
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("list")
    public Object list(Member e, HttpServletRequest request){
        PageHelper.startPage(e.getOffset(),e.getLimit());
        HttpSession httpSession = request.getSession();
        LoginUser loginUser = (LoginUser) httpSession.getAttribute("loginUser");
        if (loginUser != null && "user".equals(loginUser.getUserType())) {
            e.setId(Integer.parseInt(loginUser.getUid()));
        }
        List<Member> Members = memberService.findList(e);
        PageInfo pageInfo = new PageInfo(Members);
        Map<String,Object> map = new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }

    @ResponseBody
    @RequestMapping("findAll")
    public AjaxResult findAll(Member e){
        List<Member> members = memberService.findList(e);
        return AjaxResult.success(members);
    }

    /**
     * 修改/保存操作
     * @param e
     * @return
     */
    @ResponseBody
    @RequestMapping("/save")
    public AjaxResult save(Member e, HttpServletRequest request) {
        if (null == e.getId()) {
            Member queryMemeberParam = new Member();
            queryMemeberParam.setPhone(e.getPhone());
            List<Member> users = memberService.findList(queryMemeberParam);
            if (users != null && users.size() != 0) {
                return AjaxResult.error("当前手机号码已经被注册");
            }
        }else {
            memberService.update(e);
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
    public AjaxResult delete(Member e) {
        String ids = e.getIds();
        if ("".equals(ids) || null == ids) {
            return AjaxResult.error("请选择需要删除的数据");
        }
        memberService.deleteByIds(ids);
        return AjaxResult.success("操作成功");
    }

    /**
     * 删除
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/findMemberInfoByPhone")
    public AjaxResult findMemberInfoByPhone(HttpServletRequest request) {
        String phone = request.getParameter("phone");
        if(StringUtils.isEmpty(phone)) {
            return AjaxResult.error("手机号码不能为空");
        }
        Member member = new Member();
        member.setPhone(phone);
        List<Member> memberList = memberService.findList(member);
        if (memberList == null || memberList.size() == 0) {
            return AjaxResult.success(null);
        }
        return AjaxResult.success(memberList.get(0));
    }

    /**
     * 用户登录
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("memberLogin")
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
        Member userParam = new Member();
        userParam.setPhone(username); // 将手机作为用户名登陆
        List<Member> users = memberService.findList(userParam);
        if (users == null || users.size() == 0) {
            return AjaxResult.error("用户名或密码错误");
        }
        Member loginUser = users.get(0);
        user.setUserType("user");
        String encodeStr = Base64.getEncoder().encodeToString(password.getBytes());
        if (!encodeStr.equals(loginUser.getPassword())) { // equals函数循环判断users的List中的密码是否匹配
            return AjaxResult.error("密码错误");
        }
        String encodeStr1 = Base64.getEncoder().encodeToString(username.getBytes());
        if (!encodeStr1.equals(loginUser.getPhone())) { // equals函数循环判断users的List中的用户名是否匹配
            return AjaxResult.error("用户名错误");
        }
        user.setUid(loginUser.getId().toString());
        user.setUsername(loginUser.getMsName());
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
        Member queryMemeberParam = new Member();
        queryMemeberParam.setPhone(phone);
        List<Member> users = memberService.findList(queryMemeberParam);
        if (users != null && users.size() != 0) {
            return AjaxResult.error("当前手机号码已经被注册");
        }
        String ageStr = request.getParameter("age");
        Integer age = null;
        if (!StringUtils.isEmpty(ageStr)) {
            age = Integer.valueOf(ageStr);
        }
        Member member = new Member();
        member.setPhone(phone);
        member.setMsName(username);
        member.setPassword(password);
        member.setSex(sex);
        member.setPassword(Base64.getEncoder().encodeToString(password.getBytes()));
        member.setAge(age);
        memberService.insert(member);


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
        Member member = new Member();
        member.setId(Integer.parseInt(loginUser.getUid()));
        member.setPassword(Base64.getEncoder().encodeToString(pwd.getBytes()));
        memberService.update(member);
        return AjaxResult.success();
    }

}
