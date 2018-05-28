package com.windypath.seer.controller;

import com.windypath.seer.pojo.Category;
import com.windypath.seer.service.CategoryService;
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
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @RequestMapping(value = "admin/admin_category_add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> add(String newName){
        Map<String,Object> resultMap = new HashMap<>();
        Category c = new Category();
        c.setName(newName);
        categoryService.add(c);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","添加分类成功！");
        return resultMap;
    }

    @RequestMapping("admin/admin_category_list")
    public String list(Model model){
        List<Category> cs = categoryService.list();
        model.addAttribute("cs",cs);
        return "admin/listCategory";
    }

    @RequestMapping(value="admin/admin_category_update",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(int id, String name){
        Map<String,Object> resultMap = new HashMap<>();
        System.out.println(id + " "+ name);
        Category c = categoryService.get(id);
        c.setName(name);
        categoryService.update(c);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","修改分类名称成功");
        return resultMap;
    }
    @RequestMapping("admin/admin_category_delete")
    public String delete(int id){
        categoryService.delete(id);
        return "redirect:admin_category_list";
    }
}
