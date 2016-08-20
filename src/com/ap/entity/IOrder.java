package com.ap.entity;

public class IOrder {
	
	public int orderId;
	public String loginname;
	public String phone;
	public String purchased;
	public String address;
	public String creditCard;
	public double total;
	public String getPurchased() {
		return purchased;
	}
	public void setPurchased(String purchased) {
		this.purchased = purchased;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", loginname=" + loginname + ", phone=" + phone + ", purchased="
				+ purchased + ", address=" + address + ", creditCard=" + creditCard + ", total=" + total + "]";
	}

	
}
