package com.windypath.seer.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.windypath.seer.pojo.User;
import com.windypath.seer.service.UserService;
import com.windypath.seer.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("admin_user_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<User> us = userService.list();

        int total = (int) new PageInfo<>(us).getTotal();
        page.setTotal(total);
        model.addAttribute("us",us);
        model.addAttribute("page",page);

        return "admin/listUser";
    }

    @RequestMapping(value="/admin_user_password_update", method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> resetPwd(int userID, String newPwd){
        System.out.println("dafsadsf");
        Map<String,Object> resultMap = new HashMap<String,Object>();
        User user = userService.get(userID);
        user.setPassword(newPwd);
        userService.update(user);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","修改密码成功");
    //    System.out.println("userID: "+userID + "newPwd : "+newPwd);
        return resultMap;
    }
}
