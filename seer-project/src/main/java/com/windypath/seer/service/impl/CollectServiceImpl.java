package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.CollectMapper;
import com.windypath.seer.pojo.Collect;
import com.windypath.seer.pojo.CollectExample;
import com.windypath.seer.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectServiceImpl implements CollectService {
    @Autowired
    CollectMapper collectMapper;
    @Override
    public void add(Collect c) {
        collectMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        collectMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Collect get(int uid, int aid) {
        CollectExample example = new CollectExample();
        example.createCriteria().andAidEqualTo(aid).andUidEqualTo(uid);
        List<Collect> cs = collectMapper.selectByExample(example);
        if(cs.size() != 0){
            return cs.get(0);
        }else{
            return null;
        }
    }
}
