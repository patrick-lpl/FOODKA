package com.atguigu.crud.interceptor;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录拦截器
 */
@WebFilter(filterName = "loginInterceptor",urlPatterns = {"/*"})
public class LoginInterceptor implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String requestUri = httpServletRequest.getRequestURI();

        if(requestUri.contains("info") || requestUri.contains("toRepwd") || requestUri.contains("toList")) {
            Object user = httpServletRequest.getSession().getAttribute("loginUser");
            if (null == user) {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login");
                return;
            }
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
