package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.CommentsMapper;
import com.windypath.seer.pojo.Article;
import com.windypath.seer.pojo.Comments;
import com.windypath.seer.pojo.CommentsExample;
import com.windypath.seer.pojo.User;
import com.windypath.seer.service.CommentsService;
import com.windypath.seer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentsServiceImpl implements CommentsService {
    @Autowired
    CommentsMapper commentsMapper;
    @Autowired
    UserService userService;
    @Override
    public void add(Comments c) {
        commentsMapper.insert(c);
    }

    @Override
    public void delete(int id) {
        Comments c = commentsMapper.selectByPrimaryKey(id);
        c.setIsDeleted(1);
        commentsMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public List<Comments> list(int aid) {
        CommentsExample example = new CommentsExample();
        example.createCriteria().andAidEqualTo(aid).andIsDeletedEqualTo(0);
        example.setOrderByClause("id asc");
        List<Comments> cs =  commentsMapper.selectByExample(example);
        setUser(cs);
        return cs;
    }

    public void setUser(List<Comments> cs){
        for(Comments c:cs){
            setUser(c);
        }
    }
    public void setUser(Comments c){
        User u = userService.get(c.getUid());
        c.setUser(u);
    }

    @Override
    public Comments get(int id) {
        return commentsMapper.selectByPrimaryKey(id);
    }
}
