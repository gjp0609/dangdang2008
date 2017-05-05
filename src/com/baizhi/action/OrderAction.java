package com.baizhi.action;

import com.baizhi.entity.Product;

/**
 * 处理订单
 * Created by gjp06 on 17.5.4.
 */
public class OrderAction extends BaseAction {
    private Product product = new Product();
    private Integer count = 0;

    public String checkLogin() {
        Object o = getSessionValue("user");
        if (o == null) { // 用户未登录，跳转至登录界面
            // 设置登录状态。 1 表示订单页登陆，无或者其他值表示正常登陆
            setSessionValue("loginStatus", 1);
            return LOGIN;
        }
        return SUCCESS;
    }

    public String toAddress(){

        return SUCCESS;
    }

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
