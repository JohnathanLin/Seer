package com.windypath.seer.controller;

import com.windypath.seer.pojo.Admin;
import com.windypath.seer.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @RequestMapping("/loginVerify")
    public String login(HttpServletRequest request, HttpServletResponse response,HttpSession session){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("username",username);
        System.out.println(username + " "+ password);

        Admin res = adminService.checkUserAndPwd(username,password);

        if(res != null){
            return "redirect:admin_article_list";
        }else{
            return "redirect:index";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:index";
    }
}
