package com.windypath.seer.service;

import com.windypath.seer.pojo.Likes;


public interface LikesService {
    void add(Likes l);
    void delete(int id);
    Likes get(int uid,int aid);
}
