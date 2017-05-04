package com.baizhi.action;

import com.baizhi.entity.Page;
import com.baizhi.entity.Product;
import com.baizhi.service.impl.ProductServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理订单
 * Created by gjp06 on 17.5.4.
 */
public class OrderAction extends com.baizhi.action.BaseAction {
    private Product product = new Product();
    private Integer result = 0;

    /**
     * 加入购物车
     * 点击加入购物车时调用此 action
     * 通过传入的 id 查询商品，并存入 session 中的购物车 Map 集合中
     *
     * @return null
     */
    public String addToCart() {
        // 判断 id 是否传入
        if (product.getId() != null) {
            Map<Integer, Product> bookList = new HashMap<>();
            // 根据产品 id 查询得到产品对象
            List<Product> productList = new ProductServiceImpl().findProductByCdt(product, new Page(), null, null);
            Product p = productList.get(0);
            // 从 session 中取出购物车
            Object o = getSessionValue("books");
            // 若购物车不为 null 则取出购物车，购物车为 null 则存入新的购物车
            if (o != null)
                bookList = (Map<Integer, Product>) o;
            // 把商品放入购物车
            bookList.put(p.getId(), p);
            // 把购物车对象存入 session
            setSessionValue("books", bookList);
//            jsonObject.put();
            //  设置状态为添加成功
            result = 1;
        }
        return null;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

}
