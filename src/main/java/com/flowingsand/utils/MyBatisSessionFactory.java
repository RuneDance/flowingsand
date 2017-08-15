package com.flowingsand.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisSessionFactory {
	// 构造无参方法
	private MyBatisSessionFactory() {

	}

	private static SqlSessionFactory sqlSessionFactory = null;
	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<SqlSession>();
	static {
		try {
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			sqlSessionFactory = builder.build(Resources
					.getResourceAsReader(Global.MYBATIS_CONFIG_RESOURCES));
		} catch (Exception e) {
			throw new ExceptionInInitializerError("初始化MyBatis发生错误！");
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public static SqlSession getSession() {
		SqlSession session = threadLocal.get();
		if (session == null) {
			session = (sqlSessionFactory != null) ? sqlSessionFactory
					.openSession() : null;
			threadLocal.set(session);
		}
		return session;
	}

	public static void closeSession() {
		SqlSession session = (SqlSession) threadLocal.get();
		threadLocal.set(null);
		if (session != null) {
			session.close();
		}
	}
}