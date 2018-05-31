package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.UserMapper;
import com.windypath.seer.pojo.User;
import com.windypath.seer.pojo.UserExample;
import com.windypath.seer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public void add(User u) {
        userMapper.insert(u);
    }

    @Override
    public boolean isExist(String mobile) {
        UserExample example =new UserExample();
        example.createCriteria().andMobileEqualTo(mobile);
        List<User> result= userMapper.selectByExample(example);
        if(!result.isEmpty())
            return true;
        return false;
    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(User u) {
        userMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<User> list() {
        UserExample example = new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

    @Override
    public User checkMobileAndPwd(String mobile, String password) {
        UserExample example = new UserExample();
        example.createCriteria().andMobileEqualTo(mobile).andPasswordEqualTo(password);
        List<User> res = userMapper.selectByExample(example);
        if(res.size() != 0){
            return res.get(0);
        }else{
            return null;
        }
    }
}
