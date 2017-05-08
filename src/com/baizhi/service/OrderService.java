package com.baizhi.service;

import com.baizhi.entity.Address;
import com.baizhi.entity.Order;
import com.baizhi.entity.OrderItem;
import com.baizhi.entity.User;

import java.util.List;

/**
 * Created by gjp06 on 17.5.7.
 */
public interface OrderService {

    public List<Address> findAddress(User user);

    public List<Address> findAddressById(Address address);

    public int addAddress(Address address);

    public int addOrder(Order order);

    public int addOrderItem(List<OrderItem> items);
}
