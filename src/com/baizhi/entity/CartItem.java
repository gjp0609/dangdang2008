package com.baizhi.entity;

import java.io.Serializable;

/**
 * Created by gjp06 on 17.5.5.
 */
public class CartItem implements Serializable {
    private Product product;
    private Integer count;
    private String status;

    public CartItem() {
        this.count = 1;
        this.status = "Y";
    }


    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", count=" + count +
                ", status='" + status + '\'' +
                '}';
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
