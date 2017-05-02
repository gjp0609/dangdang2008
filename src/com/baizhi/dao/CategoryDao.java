package com.baizhi.dao;

import com.baizhi.entity.Category;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public interface CategoryDao {
    public List<Category> selectCategory(Category category);
}
