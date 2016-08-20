package com.ap.dao;

import java.util.List;


import com.ap.entity.User;

public interface UserDao {
	  public List<User> getAllUser(); //����
	  public boolean delUserById(int userId);//ɾ��
	  public boolean updateUser(User u);//�޸ļ�¼
	  public boolean checkUser(User u);
	  public void addUser(User n);//����û�
	  public User getUserByName(String loginname) ;//����ָ��name��Ӧ��ID��¼
}
