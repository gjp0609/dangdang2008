package test;

import com.baizhi.dao.ProductDao;
import com.baizhi.entity.Product;
import com.baizhi.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
class TestProductDao {
    @Test
    void testSelect() {
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        List<Product> productList = dao.selectProductByCdt(new Product(), null, null, "publishTime", -1);
        for (Product p : productList) {
            System.out.println(p);
        }
    }

    @Test
    void recommend() {
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(3);
        List<Product> productList = dao.selectRecommendProduct(list);
        for (Product p : productList) {
            System.out.println(p);
        }
    }

    @Test
    void order() {
        ProductDao dao = MyBatisUtils.getMapper(ProductDao.class);
        List<Product> productList = dao.selectProductByCdt(new Product(), null,
                null, "realPrice desc, price", -1);
        for (Product p : productList) {
            System.out.println(p);
        }
    }
}
