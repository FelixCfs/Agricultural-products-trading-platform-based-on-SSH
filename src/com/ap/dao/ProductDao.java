package com.ap.dao;

import java.util.List;

import com.ap.entity.Product;



public interface ProductDao {

	public List<Product> getAllProduct();
	public boolean delProductById(int id);
	public Product getProductById(int id);//�����ƶ�ID��¼
	public boolean updateProduct(Product p);//�޸ļ�¼
	public void addProduct(Product p);//�����¼
	public List<Product> getProductByProductName(String productName);
	public List<Product> getProductByBigcategory(String Bigcategory);
}
