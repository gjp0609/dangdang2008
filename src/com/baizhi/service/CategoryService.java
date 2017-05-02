package com.baizhi.service;

import com.baizhi.entity.Category;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public interface CategoryService {
    public List<Category> findCategory(Category category);
}
