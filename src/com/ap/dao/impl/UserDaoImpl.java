package com.ap.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.ap.dao.UserDao;
import com.ap.entity.User;
import com.ap.util.HibernateUtil;

@Repository
public class UserDaoImpl implements UserDao{

	/*
	 * 获取所有用户
	 */
	public List<User> getAllUser() {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from User");

		List<User> list = q.list();

		tx.commit();
		return list;
	}

	/*
	 * 根据id删除用户
	 * 
	 */
	public boolean delUserById(int userId) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		User u = new User();
		u.setUserId(userId);

		try {

			session.delete(u);

			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			if (null != tx) {
				tx.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			HibernateUtil.close(session);
		}
		return true;
	}

	/*
	 * 根据用户名获取用户
	 */
	public User getUserByName(String loginname) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		User u = new User();
		
		Query q = session.createQuery(" from User as u where u.loginname = ?");

		q.setParameter(0, loginname);

		List<User> list = q.list();

		for (User user : list) {
			
			u.setUserId(user.getUserId());
			u.setLoginname(user.getLoginname());
			user.setPassword(user.getPassword());

		}

		tx.commit();
		
		return u;
	}

	/*
	 * 添加用户
	 * 
	 */
	public void addUser(User u) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		User user = new User();
		user.setLoginname(u.getLoginname());
		user.setPassword(u.getPassword());

		session.save(user);

		tx.commit();
	}

	/*
	 * 用户登陆
	 * 
	 */
	public boolean checkUser(User u) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		boolean f = true;

		Query q = session.createQuery("from User as u where u.loginname = ? and u.password = ?");

		q.setParameter(0, u.getLoginname());
		q.setParameter(1, u.getPassword());

		List<User> list = q.list();
		
		tx.commit();

		if (list.isEmpty()) {
			f = false;
			return f;
		} else {
			return f;
		}
	}

	/*
	 * 更新用户
	 * 
	 */
	public boolean updateUser(User u) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		try {
			
			session.update(u);
			
			tx.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			
			if (null != tx) {
				
				tx.rollback();
			}
			
			e.printStackTrace();
			
			return false;
			
		} finally {
			
			HibernateUtil.close(session);
		}
		return true;
	}

}
