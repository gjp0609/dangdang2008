package test;

import com.baizhi.entity.User;
import com.baizhi.service.impl.UserServiceImpl;
import com.baizhi.utils.SecurityUtils;
import org.junit.jupiter.api.Test;

/**
 * 用户 service 的测试类
 * Created by gjp06 on 17.5.1.
 */
class TestUserService {
    @Test
    void testAdd() {
        User user = new User();
        user.setEmail("gjp0609@sohu.com");
        user.setNickname("Sakura");
        String salt = SecurityUtils.getRandomCode(10);
        String newPwd = SecurityUtils.getMD5("123456" + salt);
        user.setSalt(salt);
        user.setPassword(newPwd);
        user.setStatus("N");
        int i = new UserServiceImpl().addUser(user);
        System.out.println(i);
    }

}
