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

public class AdministratorUpd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdministratorUpd() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		AdministratorDao administratorDao = (AdministratorDao)context.getBean("administratorDao");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession(false);
		
		int administratorId=Integer.parseInt(request.getParameter("administratorId"));
		String loginname=request.getParameter("loginname");
		int password=Integer.parseInt(request.getParameter("password"));
		
		Administrator u = new Administrator();
		u.setAdministratorId(administratorId);
		u.setLoginname(loginname);
		u.setPassword(password);		
		
		
		try{
			boolean f = administratorDao.updateAdministrator(u);
			
			if (f){
				response.sendRedirect("Manage.jsp");
			}else{
				session.setAttribute("error","更新失败" );
				response.sendRedirect("error.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
