package com.windypath.seer.mapper;

import com.windypath.seer.pojo.Admin;
import com.windypath.seer.pojo.AdminExample;
import java.util.List;

public interface AdminMapper {
    int insert(Admin record);

    int insertSelective(Admin record);

    List<Admin> selectByExample(AdminExample example);
}