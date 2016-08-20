package com.ap.biz.impl;


import com.ap.biz.AccountBiz;
import com.ap.dao.impl.AccountDaoImpl;

	public class AccountBizImpl implements AccountBiz  {	

		public int modifyBalance(double totalMoney, String creditCard) {
			AccountDaoImpl abi=new AccountDaoImpl();
			double balance=abi.SelectBalance(creditCard);
			int n =0;
			if(balance-totalMoney>0){
				n=1;
			}else{
				n=0;
			}
			return n;
		}

		
	
	}
