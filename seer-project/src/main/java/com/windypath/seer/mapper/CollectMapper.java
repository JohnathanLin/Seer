package com.windypath.seer.mapper;

import com.windypath.seer.pojo.Collect;
import com.windypath.seer.pojo.CollectExample;
import java.util.List;

public interface CollectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Collect record);

    int insertSelective(Collect record);

    List<Collect> selectByExample(CollectExample example);

    Collect selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}