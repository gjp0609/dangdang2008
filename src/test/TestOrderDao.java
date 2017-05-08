package test;

import com.baizhi.dao.OrderDao;
import com.baizhi.entity.*;
import com.baizhi.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gjp06 on 17.5.7.
 */
public class TestOrderDao {
    @Test
    void selectAddress() {

        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        User user = new User();
        user.setId(100036);
        List<Address> addressList = dao.selectAddressByUserId(user);
        for (Address ad : addressList) {
            System.out.println(ad);
        }
    }

    @Test
    void insertOrderItem() {
        ArrayList<OrderItem> items = new ArrayList<>();
        OrderItem item = new OrderItem();
        Product product = new Product();
        product.setId(10010012);
        Order order = new Order();
        order.setId(1001001026);
        item.setCount(20);
        item.setProduct(product);
        item.setOrder(order);
        items.add(item);
        OrderDao dao = MyBatisUtils.getMapper(OrderDao.class);
        for (OrderItem oi : items) {
            System.out.println(oi);
        }
        int i = dao.insertOrderItem(items);
        System.out.println(i + " " + items.get(0).getId());
        MyBatisUtils.rollback();
    }
}
