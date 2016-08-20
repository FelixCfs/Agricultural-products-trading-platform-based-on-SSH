package com.ap.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ap.dao.AdministratorDao;
import com.ap.entity.Administrator;
import com.ap.entity.User;
import com.ap.util.HibernateUtil;

public class AdministratorDaoImpl  implements AdministratorDao {
	
	/*
	 *管理员登陆 
	 */
	public boolean checkAdministrator(Administrator ad) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();
		boolean f = true;

		Query q = session.createQuery("from Administrator as a where a.loginname = ? and a.password = ?");

		q.setParameter(0, ad.getLoginname());
		q.setParameter(1, ad.getPassword());

		List<User> list = q.list();
		
		tx.commit();
		
		HibernateUtil.close(session);

		if (list.isEmpty()) {
			f = false;
			return f;
		} else {
			return f;
		}
	}

	/*
	 * 添加管理员
	 * 
	 */
	public void addAdministrator(Administrator a) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		session.save(a);

		tx.commit();
		
		HibernateUtil.close(session);
	}

	/*
	 * 获取所有管理员
	 */
	public List<Administrator> getAllAdministrator() {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Administrator");

		List<Administrator> list = q.list();

		tx.commit();

		HibernateUtil.close(session);
		
		return list;
	}

	/*
	 * 删除管理员
	 * 
	 */
	public boolean delAdministratorById(int administratorId) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Administrator ad = new Administrator();
		ad.setAdministratorId(administratorId);

		try {

			session.delete(ad);
			
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
	 *通过登录名获取管理员
	 */
	public Administrator getAdministratorByName(String loginname) {

		Administrator ad = new Administrator();
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();
		
		Query q = session.createQuery(" from Administrator as a where a.loginname = ?");
		
		q.setParameter(0, loginname);
		
		List<Administrator> list = q.list();
		
		for (Administrator a : list) {
			
			ad.setAdministratorId(a.getAdministratorId());
			ad.setLoginname(a.getLoginname());
			ad.setPassword(a.getPassword());
			
		}
		
		tx.commit();
		
		HibernateUtil.close(session);
		
		return ad;
	}

	/*
	 * 管理员更新
	 * 
	 */
	public boolean updateAdministrator(Administrator a) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		try {
			
			session.update(a);
			
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
