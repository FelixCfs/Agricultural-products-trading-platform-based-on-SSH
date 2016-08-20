package com.ap.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ap.dao.AdministratorDao;
import com.ap.dao.impl.AdministratorDaoImpl;
import com.ap.entity.Administrator;

public class AdministratorChk extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdministratorChk() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		AdministratorDao administratorDao = (AdministratorDao)context.getBean("administratorDao");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		
		String loginname =request.getParameter("loginname");
		int password =Integer.parseInt(request.getParameter("password"));
		Administrator ad = new Administrator();
		ad.setLoginname(loginname);
		ad.setPassword(password);
		
		
		try{
			boolean f=administratorDao.checkAdministrator(ad);
			if(f){		
				session.setAttribute("loginname", loginname);	
				request.getRequestDispatcher("Manager.jsp").forward(request, response);
			}else{
				session.setAttribute("error", "�û����������");			
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}		
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}	






	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doGet(request,response);
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
