package com.windypath.seer.controller;

import com.windypath.seer.pojo.Admin;
import com.windypath.seer.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin/")
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("/login")
    public String index(){
        return "admin/login";
    }
    @RequestMapping(value="/loginVerify",method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response,HttpSession session){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    //    session.setAttribute("username",username);

        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);

        Admin res = adminService.checkUserAndPwd(username,password);

        if(res != null){
            session.setAttribute("admin",admin);


            session.setMaxInactiveInterval(30*60);

            return "SUCCESS";
        }else{
            return "redirect:login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:index";
    }
}