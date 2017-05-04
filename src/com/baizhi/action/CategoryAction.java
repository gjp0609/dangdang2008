package com.baizhi.action;

import com.baizhi.entity.Category;
import com.baizhi.service.impl.CategoryServiceImpl;

import java.util.List;

/**
 * 商品分类
 * Created by gjp06 on 17.5.2.
 */
public class CategoryAction extends BaseAction {
    private Integer id;
    private List<Category> categoryList;
    private Category category;

    /**
     * 查询所有分类，在首页显示
     *
     * @return 跳转至 category.jsp
     */
    public String findCategories() {
        categoryList = new CategoryServiceImpl().findCategory(new Category());
        return SUCCESS;
    }

    /**
     * 查找传入分类 id 的父分类
     *
     * @return 跳转至 cate.jsp
     */
    public String findParent() {
        Category category = new Category();
        category.setId(id);
        categoryList = new CategoryServiceImpl().findCategory(category);
        return SUCCESS;
    }

    /**
     * 查找传入分类 id 的子分类
     *
     * @return 跳转至 cate_list.jsp
     */
    public String findChildren() {
        Category cate = new Category();
        CategoryServiceImpl service = new CategoryServiceImpl();
        cate.setId(id);
        categoryList = service.findCategory(cate);
        if (categoryList != null && categoryList.size() == 1) {
            category = categoryList.get(0);
            // 不是父分类
            if (category.getParentCategory() != null)
                category = service.findCategory(category.getParentCategory()).get(0);
        }
        System.err.println("分类："+id + "   " + category);
        return SUCCESS;
    }


    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
