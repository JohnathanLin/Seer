package com.windypath.seer.service;

import com.windypath.seer.pojo.User;


import java.util.List;

public interface UserService {
    void add(User u);
    void delete(int id);
    void update(User u);
    User get(int id);
    List<User> list();
    boolean isExist(String mobile);
}
