package com.baizhi.dao;

import com.baizhi.entity.User;

/**
 * 用户的 Dao 接口
 * Created by gjp06 on 17.4.30.
 */
public interface UserDao {
    /**
     * 查询用户方法
     * 通过用户 email 查询
     *
     * @param email 用户邮箱
     * @return 用户对象
     */
    public User selectUser(String email);

    /**
     * 插入数据
     *
     * @param user 新的用户对象
     * @return 受影响行数
     */
    public int insertUser(User user);

    /**
     * 更新用户
     *
     * @param user 新的用户信息
     * @return 受影响行数
     */
    public int updateUser(User user);
}
