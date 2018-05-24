package com.windypath.seer.controller;

import com.windypath.seer.pojo.Article;
import com.windypath.seer.pojo.Comments;
import com.windypath.seer.service.ArticleService;
import com.windypath.seer.service.CommentsService;
import com.windypath.seer.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("admin/")
@Controller
public class CommentsController {
    @Autowired
    CommentsService commentsService;
    @Autowired
    ArticleService articleService;
    @RequestMapping("admin_comments_list")
    public String list(int aid,Model model,Page page){
        Article a = articleService.get(aid);
        List<Comments> cs = commentsService.list(aid);
        model.addAttribute("cs",cs);
        model.addAttribute("a",a);
        System.out.println(cs.toString());
        return "admin/listComments";
    }

    @RequestMapping("admin_comments_delete")
    public String delete(int id){
        Comments c = commentsService.get(id);
        int aid = c.getAid();
        commentsService.delete(id);
        return "redirect:admin_comments_list?aid="+aid;
    }
}
