package com.ap.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ap.dao.ProductDao;
import com.ap.entity.Bigcategory;
import com.ap.entity.Product;
import com.ap.util.HibernateUtil;

public class ProductDaoImpl  implements ProductDao {

	/*
	 * 获取所有货品
	 * 
	 */
	public List<Product> getAllProduct() {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Product ");

		List<Product> list = q.list();

		tx.commit();

		HibernateUtil.close(session);
		
		return list;
	}

	/*
	 * 获取所有种类
	 */
	public List<Bigcategory> getAllBigcategory() {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Bigcategory ");

		List<Bigcategory> list = q.list();

		tx.commit();

		HibernateUtil.close(session);
		
		return list;
	}

	/*
	 * 根据id删除货品
	 * 
	 */
	public boolean delProductById(int id) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Product p = new Product();
		p.setProductId(id);

		try {

			session.delete(p);
			
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
	 * 根据id获取货品
	 */
	public Product getProductById(int id) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Product p = new Product();

		Query q = session.createQuery(" from Product as p where p.productId = ?");
		
		q.setParameter(0, id);
		
		List<Product> list = q.list();
		
		for (Product pl : list) {
			
			p.setProductId(pl.getProductId());
			p.setProductName(pl.getProductName());
			p.setImageFile(pl.getImageFile());
			p.setBigcategory(pl.getBigcategory());
			p.setIntroduce(pl.getIntroduce());
			p.setPrice(pl.getPrice());
		}
		
		tx.commit();
		
		HibernateUtil.close(session);
		
		return p;
	}

	/*
	 * 根据种类获取货品
	 */
	public List<Product> getProductByBigcategory(String bigcategory) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Product as p where p.bigcategory = ?");
		
		q.setParameter(0, bigcategory);

		List<Product> list = q.list();

		tx.commit();
		
		HibernateUtil.close(session);
		
		return list;
	}

	/*
	 * 根据产品名称获取货品
	 */
	public List<Product> getProductByProductName(String productName) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Query q = session.createQuery(" from Product as p where p.productName like ?");
		
		q.setParameter(0, "%"+productName+"%");

		List<Product> list = q.list();

		tx.commit();
		
		HibernateUtil.close(session);
		
		return list;
	}

	/*
	 * 更新货品
	 * 
	 */
	public boolean updateProduct(Product p) {
		
		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		try {

			session.update(p);

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
	 *添加货品
	 * 
	 */
	public void addProduct(Product pr) {

		Session session = HibernateUtil.openSession();

		Transaction tx = session.beginTransaction();

		Product p = new Product();
		p.setProductId(pr.getProductId());
		p.setProductName(pr.getProductName());
		p.setImageFile(pr.getImageFile());
		p.setBigcategory(pr.getBigcategory());
		p.setIntroduce(pr.getIntroduce());
		p.setPrice(pr.getPrice());

		session.save(p);

		tx.commit();
		
		HibernateUtil.close(session);
	}
}
