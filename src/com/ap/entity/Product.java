package com.ap.entity;

import java.io.Serializable;

public class Product implements Serializable{
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public String getBigcategory() {
		return bigcategory;
	}
	public void setBigcategory(String bigcategory) {
		this.bigcategory = bigcategory;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	private int productId;
	private String productName;
	private String imageFile;
	private String bigcategory;
	private String introduce;
	private double price;
	
}
