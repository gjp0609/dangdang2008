package com.baizhi.dao;

import com.baizhi.entity.Order;

import java.util.List;

/**
 * Created by gjp06 on 17.5.5.
 */
public interface OrderDao {

    public List<Order> selectOrder(Order order);
}
