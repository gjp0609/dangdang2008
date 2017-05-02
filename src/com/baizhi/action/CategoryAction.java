package com.baizhi.action;

import com.baizhi.entity.Category;
import com.baizhi.service.impl.CategoryServiceImpl;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public class CategoryAction extends BaseAction {
    private List<Category> categoryList;

    public String findCategories() {
        categoryList = new CategoryServiceImpl().findCategory(new Category());
        return SUCCESS;
    }


    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }
}
