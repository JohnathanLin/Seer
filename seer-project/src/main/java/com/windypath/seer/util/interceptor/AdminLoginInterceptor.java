package com.windypath.seer.util.interceptor;

import com.windypath.seer.pojo.Admin;
import com.windypath.seer.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginInterceptor implements HandlerInterceptor{
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String url = request.getRequestURI();
        if(url.indexOf("login") >= 0){
            return true;
        }
        HttpSession session = request.getSession();
        /*
        String username = (String) session.getAttribute("username");

        if(username != null){
            return true;
        }
        response.sendRedirect("login");
        return false;
        */

        Admin admin = (Admin) session.getAttribute("admin");
        if(admin != null){
            return true;
        }
        response.sendRedirect("login");
        return false;
    }
}
