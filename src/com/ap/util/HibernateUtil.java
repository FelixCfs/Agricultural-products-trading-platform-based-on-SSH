package com.ap.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	//静态代码块,在程序运行的周期中，只执行一次。
	static{
		try{
			sessionFactory = new Configuration().configure().buildSessionFactory();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static Session openSession(){
		Session session = sessionFactory.openSession();
		return session;
	}
	
	public static void close(Session session){
		if(null != session){
			session.close();
		}
	}
}
