package test;

import com.baizhi.dao.UserDao;
import com.baizhi.utils.MyBatisUtils;
import org.junit.jupiter.api.Test;

/**
 * Created by gjp06 on 17.5.1.
 */
public class testMybatis {

    @Test
    void testget(){
        UserDao mapper = MyBatisUtils.getMapper(UserDao.class);
        System.out.println(mapper);
    }
}
