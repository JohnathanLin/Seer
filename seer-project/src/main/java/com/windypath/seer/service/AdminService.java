package com.windypath.seer.service;

import com.windypath.seer.pojo.Admin;

public interface AdminService {
    //1成功 0用户名或密码错误
    Admin checkUserAndPwd(String username, String password);
}
