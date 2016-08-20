package com.ap.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ap.dao.AccountDao;
import com.ap.util.HibernateUtil;

public class AccountDaoImpl  implements AccountDao {

	public double SelectBalance(String creditCard) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery("select balance from Account as a where a.creditCard = ? ");

		q.setParameter(0, creditCard);

		double balance = (Double) q.uniqueResult();

		tx.commit();

		HibernateUtil.close(session);

		return balance;
	}
}
