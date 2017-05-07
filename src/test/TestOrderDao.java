package test;

import com.baizhi.dao.OrderDao;
import com.baizhi.entity.Address;
import com.baizhi.entity.User;
import com.baizhi.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

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
}
