package com.baizhi.action;

import com.baizhi.entity.Product;

/**
 * 处理订单
 * Created by gjp06 on 17.5.4.
 */
public class OrderAction extends com.baizhi.action.BaseAction {
    private Product product = new Product();
    private Integer count = 0;


    /**
     * public String addToCart() {
     * // 判断 id 是否传入
     * if (product.getId() != null) {
     * Map<Integer, CartItem> items = new HashMap<>();
     * CartItem item = new CartItem();
     * // 根据产品 id 查询得到产品对象
     * List<Product> productList = new ProductServiceImpl().findProductByCdt(product,
     * new Page(), null, null);
     * if (productList == null || productList.size() < 1) return null;
     * Product p = productList.get(0);
     * System.out.println(p.getId() + " " + p.getTitle() + " " + count);
     * // 从 session 中取出购物车（订单项集合）
     * Object o = getSessionValue("items");
     * // 若购物车不为 null 则取出购物车，购物车为 null 则存入新的购物车
     * if (o == null) {
     * item.setProduct(p);
     * items.put(p.getId(), item);
     * } else { // 若购物车不为 null 则取出购物车
     * // 取出购物项集合
     * items = (Map<Integer, CartItem>) o;
     * // 从购物车内取此商品
     * CartItem test = items.get(p.getId());
     * if (test == null) { // 购物车内无此商品
     * item.setProduct(p);
     * } else { // 购物车内有此商品
     * item = test;
     * item.setCount(item.getCount() + count);
     * // 如果
     * if (item.getCount() < 1) items.remove(item.getProduct().getId());
     * }
     * }
     * // 把商品放回购物车
     * items.put(p.getId(), item);
     * // 把购物车对象存入 session
     * setSessionValue("items", items);
     * for (Map.Entry<Integer, CartItem> ca : items.entrySet()) {
     * System.out.println(" --> " + ca.getKey() + " " + ca.getValue().getCount());
     * }
     * }
     * return null;
     * }
     */

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
