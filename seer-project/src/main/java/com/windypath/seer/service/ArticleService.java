package com.windypath.seer.service;

import com.windypath.seer.pojo.Article;

import java.util.List;

public interface ArticleService {
    void add(Article a);
    void delete(int id);
    void update(Article a);
    Article get(int id);
    List<Article> list();
    //搜索某个用户的文章
}
