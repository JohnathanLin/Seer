package com.windypath.seer.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class PageController {
    @RequestMapping("/index")
    public String index(){
        return "fore/index";
    }
}
