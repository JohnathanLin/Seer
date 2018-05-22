package com.windypath.seer.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.windypath.seer.pojo.Article;
import com.windypath.seer.service.ArticleService;
import com.windypath.seer.service.UserService;
import com.windypath.seer.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/")
public class ArticleController {
    @Autowired
    UserService userService;
    @Autowired
    ArticleService articleService;

    @RequestMapping("admin_article_add")
    public String add(Model model,Article a){
        a.setCreateDate(new Date());
        articleService.add(a);
        return "redirect:admin_article_list";
    }

    @RequestMapping("admin_article_delete")
    public String delete(int id){
        articleService.delete(id);
        return "redirect:admin_article_list";
    }
    @RequestMapping("admin_article_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Article> as = articleService.list();
        int total = (int) new PageInfo<>(as).getTotal();
        page.setTotal(total);
        model.addAttribute("as",as);
        model.addAttribute("page",page);
        return "admin/listArticle";
    }
    @RequestMapping("admin_article_edit")
    public String edit(Model model,int id){
        Article a = articleService.get(id);
        model.addAttribute("a",a);
        return "admin/editArticle";
    }
    @RequestMapping(value="admin_article_update", method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(int id, String title, String content,int status){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        Article a = articleService.get(id);
        a.setTitle(title);
        a.setContent(content);
        a.setStatus(status);
        if(status != 0){
            a.setVerifyDate(new Date());
        }
        articleService.update(a);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","修改预言成功");

        return resultMap;
    }


}
