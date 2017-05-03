package com.baizhi.service.impl;

import com.baizhi.dao.ProductDao;
import com.baizhi.entity.Page;
import com.baizhi.entity.Product;
import com.baizhi.service.ProductService;
import com.baizhi.utils.MyBatisUtils;

import java.util.*;

/**
 * Created by gjp06 on 17.5.2.
 */
public class ProductServiceImpl implements ProductService {
    @Override
    public List<Product> findProductByCdt(Product product, Page page, String orderName, Integer order) {
        List<Product> productList = null;
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        if (orderName == null) order = null;
        if (page != null) {
            page.setTotalRows(dao.selectTotalRows());
            productList = dao.selectProductByCdt(product, page.getFirstRow(), page.getLastRow(), orderName, order);
        } else {
            productList = dao.selectProductByCdt(product, null, null, orderName, order);
        }
        return productList;
    }

    @Override
    public List<Product> findRecommendProduct() {
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        int i = dao.selectTotalRows();
        List<Integer> list = new ArrayList<>();

        Random random = new Random(new Date().getTime());
        int a = random.nextInt(i);
        int b;
        do {
            b = random.nextInt(i);
        } while (b == a);
        list.add(a + 1);
        list.add(b + 1);
        return dao.selectRecommendProduct(list);
    }
}
