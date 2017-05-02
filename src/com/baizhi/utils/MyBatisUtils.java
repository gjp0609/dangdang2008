package com.baizhi.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * mybatis 工具类
 * Created by gjp06 on 17.4.13.
 */
public class MyBatisUtils {
    private static final SqlSessionFactory FACTORY;
    private static final ThreadLocal<SqlSession> TL = new ThreadLocal<>();

    static {
        try {
            InputStream is = Resources.getResourceAsStream("resources/mybatis-config.xml");
            FACTORY = new SqlSessionFactoryBuilder().build(is);
        } catch (Exception e) {
            throw new RuntimeException("MyBatisUtils 初始化失败", e);
        }
    }

    private static SqlSession openSession() {
        SqlSession sqlSession = TL.get();
        if (sqlSession == null) {
            sqlSession = FACTORY.openSession();
            TL.set(sqlSession);
        }
        return sqlSession;
    }

    public static void closeSession() {
        openSession().close();
        TL.remove();
    }

    public static void commit() {
        openSession().commit();
        closeSession();
    }

    public static void rollback() {
        openSession().rollback();
        closeSession();
    }

    public static <T> T getMapper(Class<T> tClass) {
        return openSession().getMapper(tClass);
    }

}
