package com.baizhi.action;

import com.baizhi.entity.*;
import com.baizhi.service.impl.OrderServiceImpl;
import com.baizhi.utils.SecurityUtils;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 处理订单
 * Created by gjp06 on 17.5.4.
 */
public class OrderAction extends BaseAction {
    private List<Integer> addressList = new ArrayList<>();
    private Address address = new Address();
    private Integer addressId = 0;
    private Integer id = 0;
    private Order order = new Order();

    public String checkLogin() {
        Object o = getSessionValue("user");
        if (o == null) { // 用户未登录，跳转至登录界面
            // 设置登录状态。 1 表示订单页登陆，无或者其他值表示正常登陆
            setSessionValue("loginStatus", 1);
            return LOGIN;
        }
        return SUCCESS;
    }

    public String toAddress() {
        Object o = getSessionValue("user");
        User u = (User) o;
        if (u == null) return LOGIN;
        List<Address> addList = new OrderServiceImpl().findAddress(u);
        for (Address add : addList)
            addressList.add(add.getId());

        address.setId(addressId);
        List<Address> addressList = new OrderServiceImpl().findAddressById(address);

        if (addressList != null && addressList.size() > 0)
            address = addressList.get(0);
        return SUCCESS;
    }

    public String checkAddress() {
        OrderServiceImpl service = new OrderServiceImpl();
        User user = (User) getSessionValue("user");
        address.setUser(user);
        // 新地址
        if (address != null && address.getId() == 0) {
            System.out.println(address + "\n" + user);
            service.addAddress(address);
        }
        List<Address> add = service.findAddressById(address);
        if (add == null || add.size() < 1) return ERROR;

        // 创建订单
        order.setCode(SecurityUtils.getRandomCode(20));
        order.setStatus("Y");
        order.setAddress(address);
        service.addOrder(order);
        // 创建订单项
        List<OrderItem> orderItems = new ArrayList<>();
        Object o = getSessionValue("items");
        Map<Integer, CartItem> items = (Map<Integer, CartItem>) o;
        double tp = 0;
        for (Map.Entry<Integer, CartItem> item : items.entrySet()) {
            CartItem cartItem = item.getValue();
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setCount(cartItem.getCount());
            orderItem.setOrder(order);
            orderItems.add(orderItem);
            service.addOrderItem(orderItem);
            tp += cartItem.getProduct().getPrice() * cartItem.getCount();
        }
        order.setItems(orderItems);
        order.setTotalPrice(tp);

        int i = service.addOrder(order);
        ServletActionContext.getRequest().getSession().removeAttribute("items");
        return SUCCESS;
    }

    public List<Integer> getAddressList() {
        return addressList;
    }

    public void setAddressList(List<Integer> addressList) {
        this.addressList = addressList;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
