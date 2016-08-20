package com.ap.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ap.dao.WordsDao;
import com.ap.entity.Words;
import com.ap.util.HibernateUtil;

public class WordsDaoImpl implements WordsDao {

	/*
	 * 获取所有留言
	 * 
	 */
	public List<Words> getAllWords() {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Words");

		List<Words> list = q.list();

		tx.commit();

		HibernateUtil.close(session);

		return list;
	}

	/*
	 * 根据 Id 删除留言
	 * 
	 */
	public boolean delWordsById(int wordsId) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Words w = new Words();
		w.setWordsId(wordsId);

		try {

			session.delete(w);
			
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
	 * 添加留言
	 * 
	 */
	public void addWords(Words w) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		session.save(w);

		tx.commit();

		HibernateUtil.close(session);
	}

	/*
	 * 添加回复
	 * 
	 */
	public void addWordsRet(String ret, int wordsId) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Words where wordsId =?");

		q.setParameter(0, wordsId);

		Words w = new Words();

		List<Words> list = q.list();

		for (Words wl : list) {
			w.setWordsId(wl.getWordsId());
			w.setRet(wl.getRet());
			
			session.update(w);
		}

		tx.commit();

		HibernateUtil.close(session);

	}
}
