package com.atguigu.crud.utils.tools;

import com.atguigu.crud.entity.LoginUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * 用户工具类
 */
public class UserUtils {

    /**
     * 获取登录用户id
     * @param request
     * @return
     */
    public static String getLoginUserId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session == null) {
            return  "1";
        }
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        return loginUser.getUid();
    }

}
