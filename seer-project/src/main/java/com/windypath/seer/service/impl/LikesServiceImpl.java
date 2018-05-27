package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.LikesMapper;
import com.windypath.seer.pojo.Likes;
import com.windypath.seer.pojo.LikesExample;
import com.windypath.seer.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikesServiceImpl implements LikesService {
    @Autowired
    LikesMapper likesMapper;
    @Override
    public void add(Likes l) {
        likesMapper.insert(l);
    }

    @Override
    public void delete(int id) {
        likesMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Likes get(int uid, int aid) {
        LikesExample example = new LikesExample();
        example.createCriteria().andAidEqualTo(aid).andUidEqualTo(uid);
        List<Likes> ls = likesMapper.selectByExample(example);
        if(ls.size() != 0){
            return ls.get(0);
        }else{
            return null;
        }

    }
}
