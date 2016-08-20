package com.ap.dao;

import java.util.List;

import com.ap.entity.Administrator;
import com.ap.entity.User;

public interface AdministratorDao{
	public boolean checkAdministrator(Administrator ad);
    public void addAdministrator(Administrator a);
    public List<Administrator> getAllAdministrator();
	public boolean delAdministratorById(int administratorId) ;
	public Administrator getAdministratorByName(String loginname) ;
	public boolean updateAdministrator(Administrator u);//ÐÞ¸Ä¼ÇÂ¼
}