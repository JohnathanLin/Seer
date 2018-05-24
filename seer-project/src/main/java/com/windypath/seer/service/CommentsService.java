package com.windypath.seer.service;

import com.windypath.seer.pojo.Comments;

import java.util.List;

public interface CommentsService {
    void add(Comments c);
    void delete(int id);
    List<Comments> list(int aid);
    Comments get(int id);
}
