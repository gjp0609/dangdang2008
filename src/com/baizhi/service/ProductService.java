package com.baizhi.service;

import com.baizhi.entity.Page;
import com.baizhi.entity.Product;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public interface ProductService {
    /**
     * @param product   筛选条件
     * @param page      分页
     * @param orderName 排序依据 (publishTime, count)
     * @param order     <br/>1 为正序<br/>-1 为倒序
     * @return 商品对象集合
     */
    public List<Product> findProductByCdt(Product product, Page page, String orderName, Integer order);

    /**
     * 查询推荐图书
     * @return 图书列表
     */
    public List<Product> findRecommendProduct();


}
