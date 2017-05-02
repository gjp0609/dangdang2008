package com.baizhi.service;

import com.baizhi.entity.User;

/**
 * 用户服务对象
 * Created by gjp06 on 17.4.30.
 */
public interface UserService {
    /**
     * 通过用户 Email 查找用户
     *
     * @param email 用户邮箱
     * @return 完整用户对象
     */
    public User findUser(String email);

    /**
     * 新增用户
     *
     * @param user 新的用户的对象
     * @return 插入结果 <br/>1 表示成功 <br/>0 表示失败
     */
    public int addUser(User user);

    /**
     * 修改用户信息
     *
     * @param user 新的用户信息
     * @return 修改结果 <br/>1 表示成功 <br/>0 表示失败
     */
    public int modifyUser(User user);
}
