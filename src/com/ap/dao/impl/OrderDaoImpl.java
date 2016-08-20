package com.ap.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ap.dao.OrderDao;
import com.ap.entity.Account;
import com.ap.util.HibernateUtil;
import com.ap.entity.IOrder;

public class OrderDaoImpl implements OrderDao {

	/*
	 * 插入订单
	 */

	public boolean insertOrder(IOrder order) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();
		try {

			System.out.println(order.toString());

			session.save(order);

			Query q = session.createQuery(" from Account as a where a.creditCard = ?");

			q.setParameter(0, order.getCreditCard());

			List<Account> list = q.list();

			for (Account a : list) {

				if (a.getBalance() > order.getTotal()) {

					System.out.println(a.toString());

					a.setBalance(a.getBalance() - order.getTotal());

					session.saveOrUpdate(a);
				} else {

					tx.rollback();

					return false;
				}
			}

			tx.commit();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
				return false;
			}
		} finally {

			HibernateUtil.close(session);
		}

		return true;

	}

	/*
	 * 获取所有订单
	 */
	public List<IOrder> getAllOrder() {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Order");

		List<IOrder> list = q.list();

		tx.commit();

		HibernateUtil.close(session);

		return list;
	}

}
