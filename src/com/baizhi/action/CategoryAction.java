package com.baizhi.action;

import com.baizhi.entity.Category;
import com.baizhi.service.impl.CategoryServiceImpl;

import java.util.List;

/**
 * 商品分类 action
 * Created by gjp06 on 17.5.2.
 */
public class CategoryAction extends BaseAction {
    // 分类id
    private Integer id;
    // 分类集合，用来传输数据
    private List<Category> categoryList;
    // 父分类对象，用于 findChildren()
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
     * 用来查询一个父分类和它的所有子分类
     * 如果传入的是子类 id 则再次查询得到父分类对象
     *
     * @return 查询完毕跳转至 cate_list.jsp
     */
    public String findChildren() {
        CategoryServiceImpl service = new CategoryServiceImpl();
        // 定义分类对象作为查询条件
        Category cate = new Category();
        cate.setId(id);
        categoryList = service.findCategory(cate);
        // 非空判断
        if (categoryList != null && categoryList.size() == 1) {
            // 获得分类列表中第一个（唯一的）值
            category = categoryList.get(0);
            // 如果此分类的父类id 为 null，则此分类不是父分类
            if (category.getParentCategory() != null)
                // 根据分类父id 查询父分类
                category = service.findCategory(category.getParentCategory()).get(0);
        }
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
