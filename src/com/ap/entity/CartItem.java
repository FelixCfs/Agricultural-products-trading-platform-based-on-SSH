package com.ap.entity;

import java.io.Serializable;

public class CartItem implements Serializable {
	private Product p;
	private int quality;

	public CartItem(Product p, int i) {
		this.p = p;
		this.quality = i;
	}

	public Product getProduct() {
		return p;
	}

	public void setProduct(Product p) {
		this.p = p;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

}
