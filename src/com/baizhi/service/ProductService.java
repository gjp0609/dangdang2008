package com.baizhi.service;

import com.baizhi.entity.Page;
import com.baizhi.entity.Product;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
public interface ProductService {
    public List<Product> findProductByCdt(Product product, Page page, String orderName, Integer order);

    public List<Product> findRecommendProduct();


}
