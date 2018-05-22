package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.AdminMapper;
import com.windypath.seer.pojo.Admin;
import com.windypath.seer.pojo.AdminExample;
import com.windypath.seer.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin checkUserAndPwd(String username,String password) {
        AdminExample example = new AdminExample();
        example.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<Admin> res = adminMapper.selectByExample(example);
        if(res.size() != 0){
            return res.get(0);
        }else{
            return null;
        }
    }
}
