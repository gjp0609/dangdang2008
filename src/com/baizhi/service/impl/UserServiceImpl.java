package com.baizhi.service.impl;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.utils.MyBatisUtils;
import com.baizhi.utils.SecurityUtils;

/**
 * Created by gjp06 on 17.4.30.
 */
public class UserServiceImpl implements UserService {
    @Override
    public User findUser(String email) {
        User user = null;
        try {
            if (email == null) throw new RuntimeException("请输入你的email");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            user = dao.selectUser(email);
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            throw new RuntimeException(e.getMessage());
        }
        return user;
    }

    @Override
    public int addUser(User user) {
        int result = 0;
        try {
            if (user == null) throw new RuntimeException("未得到用户信息");
            // 得到盐
            String salt = SecurityUtils.getRandomCode(10);
            user.setSalt(salt);
            // 得到加密后的密码，加密方式为【原密码+盐】获取 MD5
            String pwd = SecurityUtils.getMD5(user.getPassword() + salt);
            user.setPassword(pwd);
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            result = dao.insertUser(user);
            if (result == 0) throw new RuntimeException("注册失败");
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            throw new RuntimeException(e.getMessage());
        }
        return result;
    }

    @Override
    public int modifyUser(User user) {
        int result = 0;
        try {
            if (user == null) throw new RuntimeException("未得到用户信息");
            UserDao dao = MyBatisUtils.getMapper(UserDao.class);
            result = dao.updateUser(user);
            if (result == 0) throw new RuntimeException("更新信息失败");
            MyBatisUtils.commit();
        } catch (Exception e) {
            MyBatisUtils.rollback();
            throw new RuntimeException(e.getMessage());
        }
        return result;
    }
}
