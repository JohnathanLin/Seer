package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.ArticleMapper;
import com.windypath.seer.pojo.Article;
import com.windypath.seer.pojo.ArticleExample;
import com.windypath.seer.pojo.Category;
import com.windypath.seer.pojo.User;
import com.windypath.seer.service.ArticleService;
import com.windypath.seer.service.CategoryService;
import com.windypath.seer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;
    @Autowired
    UserService userService;
    @Autowired
    CategoryService categoryService;

    @Override
    public void add(Article a) {
        articleMapper.insert(a);
    }

    //逻辑删除
    @Override
    public void delete(int id) {
        Article a = articleMapper.selectByPrimaryKey(id);
        a.setIsDeleted(1);
        articleMapper.updateByPrimaryKeySelective(a);

    }

    @Override
    public void update(Article a) {
        articleMapper.updateByPrimaryKeySelective(a);
    }

    @Override
    public Article get(int id) {
        return articleMapper.selectByPrimaryKey(id);
    }
    public void setUserAndCategory(List<Article> as){
        for(Article a:as){
            setUser(a);
            setCategory(a);
        }
    }
    public void setUser(Article a){
        User u = userService.get(a.getUid());
        a.setUser(u);
    }

    public void setCategory(Article a){
        Category c = categoryService.get(a.getCid());
        a.setCategory(c);
    }
    @Override
    public List<Article> list() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("id asc");
        example.createCriteria().andIsDeletedEqualTo(0);
        List result = articleMapper.selectByExample(example);
        setUserAndCategory(result);
        return result;
    }
}
