package com.windypath.seer.service;

import com.windypath.seer.pojo.Category;

import java.util.List;

public interface CategoryService {
    void add(Category c);
    void update(Category c);
    void delete(int id);
    Category get(int id);
    List<Category> list();
}
