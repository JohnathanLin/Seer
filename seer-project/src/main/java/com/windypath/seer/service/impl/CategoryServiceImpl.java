package com.windypath.seer.service.impl;

import com.windypath.seer.mapper.CategoryMapper;
import com.windypath.seer.pojo.Category;
import com.windypath.seer.pojo.CategoryExample;
import com.windypath.seer.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public void add(Category c) {
        categoryMapper.insert(c);
    }

    @Override
    public void update(Category c) {
        categoryMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Category> list() {
        CategoryExample example = new CategoryExample();
        example.setOrderByClause("id asc");
        return categoryMapper.selectByExample(example);
    }
}
