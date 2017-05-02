package test;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.utils.MyBatisUtils;
import com.baizhi.utils.SecurityUtils;
import org.junit.jupiter.api.Test;

/**
 * 用户 dao 测试类
 * Created by gjp06 on 17.5.1.
 */
class TestUserDao {

    /**
     * 查询测试
     */
    @Test
    void testSelect() {
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        User user = dao.selectUser("gjp0609@163.com");
        System.out.println(user);
        MyBatisUtils.rollback();
    }

    /**
     * 测试更新用户的 dao
     */
    @Test
    void testUpdate() {
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        String salt = SecurityUtils.getRandomCode(10);
        String newPwd = SecurityUtils.getMD5("123456" + salt);
        // 新的用户信息
        User newUser = new User();
        newUser.setEmail("gjp0609@qq.com");
        newUser.setSalt(salt);
        newUser.setPassword(newPwd);
        int i = dao.updateUser(newUser);
        newUser = dao.selectUser("gjp0609@qq.com");
        System.out.println(i + " " + newUser);
        MyBatisUtils.rollback();
    }

    /**
     * 测试添加用户的 dao
     */
    @Test
    void testInsert() {
        User user = new User();
        user.setEmail("gjp0609@sohu.com");
        user.setNickname("Sakura");
        String salt = SecurityUtils.getRandomCode(10);
        String newPwd = SecurityUtils.getMD5("123456" + salt);
        user.setSalt(salt);
        user.setPassword(newPwd);
        user.setStatus("N");
        UserDao dao = MyBatisUtils.getMapper(UserDao.class);
        int i = dao.insertUser(user);
        System.out.println(i);
        MyBatisUtils.rollback();
    }


}
