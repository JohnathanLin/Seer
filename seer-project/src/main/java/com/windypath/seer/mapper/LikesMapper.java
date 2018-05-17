package com.windypath.seer.mapper;

import com.windypath.seer.pojo.Likes;
import com.windypath.seer.pojo.LikesExample;
import java.util.List;

public interface LikesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Likes record);

    int insertSelective(Likes record);

    List<Likes> selectByExample(LikesExample example);

    Likes selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Likes record);

    int updateByPrimaryKey(Likes record);
}