package com.baizhi.service.impl;

import com.baizhi.dao.CategoryDao;
import com.baizhi.entity.Category;
import com.baizhi.service.CategoryService;
import com.baizhi.utils.MyBatisUtils;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public class CategoryServiceImpl implements CategoryService {
    @Override
    public List<Category> findCategory(Category category) {
        CategoryDao dao = MyBatisUtils.getMapper(CategoryDao.class);
        List<Category> categoryList = dao.selectCategory(category);
        return categoryList;
    }
}
