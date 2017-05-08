package com.baizhi.service.impl;

import com.baizhi.dao.OrderDao;
import com.baizhi.entity.Address;
import com.baizhi.entity.Order;
import com.baizhi.entity.OrderItem;
import com.baizhi.entity.User;
import com.baizhi.service.OrderService;
import com.baizhi.utils.MyBatisUtils;

import java.util.List;

/**
 * Created by gjp06 on 17.5.7.
 */
public class OrderServiceImpl implements OrderService {


    @Override
    public List<Address> findAddress(User user) {
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        return dao.selectAddressByUserId(user);
    }

    @Override
    public List<Address> findAddressById(Address address) {
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        return dao.selectAddressById(address);
    }

    @Override
    public int addAddress(Address address) {
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        return dao.insertAddress(address);
    }

    @Override
    public int addOrder(Order order) {
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        return dao.insertOrder(order);
    }

    @Override
    public int addOrderItem(List<OrderItem> items) {
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        return dao.insertOrderItem(items);
    }


}
