package com.windypath.seer.controller;

import com.windypath.seer.pojo.Collect;
import com.windypath.seer.service.CollectService;
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
public class CollectController {
    @Autowired
    CollectService collectService;
    @RequestMapping(value="admin_collect_add",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> add(int uid,int aid){
        Map<String,Object> resultMap = new HashMap<>();
        Collect c = new Collect();
        c.setUid(uid);
        c.setAid(aid);
        c.setCreateDate(new Date());
        collectService.add(c);
        resultMap.put("result","SUCCESS");
        resultMap.put("resultMsg","收藏成功");
        return resultMap;
    }

    @RequestMapping(value="admin_collect_delete",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delete(int uid,int aid){
        Map<String,Object> resultMap = new HashMap<>();
        Collect l = collectService.get(uid,aid);
        if(l == null){
            resultMap.put("result","SUCCESS");
            resultMap.put("resultMsg","不进行操作");
        }else {
            collectService.delete(l.getId());
            resultMap.put("result", "SUCCESS");
            resultMap.put("resultMsg", "收藏取消");
        }
        return resultMap;
    }
}
