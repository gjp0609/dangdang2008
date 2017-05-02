package test;

import com.baizhi.dao.CategoryDao;
import com.baizhi.entity.Category;
import com.baizhi.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * Created by gjp06 on 17.5.2.
 */
class TestCategoryDao {
    @Test
    void select() {
        CategoryDao dao = MyBatisUtils.getMapper(CategoryDao.class);
        List<Category> categoryList = dao.selectCategory(new Category());
        for (Category c : categoryList) {
            System.out.println(c);
        }
    }
}
