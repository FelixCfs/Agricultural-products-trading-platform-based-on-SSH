package com.ap.dao;

import java.util.List;

import com.ap.entity.Account;
import com.ap.entity.IOrder;


public interface OrderDao {
	public boolean insertOrder(IOrder order);
	public List<IOrder> getAllOrder() ;
}
