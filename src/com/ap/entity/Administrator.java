package com.ap.entity;

public class Administrator {
	private int password;
	private String loginname;
	private int administratorId;
	public int getAdministratorId() {
		return administratorId;
	}

	public void setAdministratorId(int administratorId) {
		this.administratorId = administratorId;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int i) {
		this.password = i;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

//	public Administrator(String loginname, String password) {
//		this.loginname = loginname;
//		this.password = password;
//	}
}
