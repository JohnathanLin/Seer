package com.windypath.seer.controller;

import com.sun.org.apache.regexp.internal.RE;
import com.windypath.seer.pojo.Likes;
import com.windypath.seer.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("admin/")
public class LikesController {
    @Autowired
    LikesService likesService;
    @RequestMapping(value="admin_likes_add",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> add(int uid,int aid){
        Map<String,Object> resultMap = new HashMap<>();
        Likes l = new Likes();
        l.setUid(uid);
        l.setAid(aid);
        l.setCreateDate(new Date());
        likesService.add(l);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","点赞成功");
        return resultMap;
    }

    @RequestMapping(value="admin_likes_delete",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delete(int uid,int aid){
        Map<String,Object> resultMap = new HashMap<>();
        Likes l = likesService.get(uid,aid);
        if(l == null){
            resultMap.put("result","SUCCESS");
            resultMap.put("resultMsg","不进行操作");
        }else {
            likesService.delete(l.getId());
            resultMap.put("result", "SUCCESS");
            resultMap.put("resultMsg", "点赞取消");
        }
        return resultMap;
    }
}
