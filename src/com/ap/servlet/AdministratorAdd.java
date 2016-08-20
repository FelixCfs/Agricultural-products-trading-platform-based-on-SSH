package com.ap.servlet;

import java.io.IOException;
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

public class AdministratorAdd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdministratorAdd() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		AdministratorDao administratorDao = (AdministratorDao)context.getBean("administratorDao");
		 
		HttpSession session =request.getSession(false);
		String loginname=request.getParameter("loginname");
		int password=Integer.parseInt(request.getParameter("password"));
		Administrator a =new Administrator();
		a.setLoginname(loginname);
		a.setPassword(password);
		
		try{
			administratorDao.addAdministrator(a);
			response.sendRedirect("AdManager.jsp");
		}catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("error","添加失败" );
			response.sendRedirect("error.jsp");
		}

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
