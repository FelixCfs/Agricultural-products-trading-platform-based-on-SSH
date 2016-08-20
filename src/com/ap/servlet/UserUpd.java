package com.ap.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ap.dao.UserDao;
import com.ap.dao.impl.UserDaoImpl;
import com.ap.entity.User;

public class UserUpd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserUpd() {
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
	       
		 UserDao userDao = (UserDao)context.getBean("userDao");
		 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession(false);
		
		int userId=Integer.parseInt(request.getParameter("userId"));
		String loginname=request.getParameter("loginname");
		int password=Integer.parseInt(request.getParameter("password"));
		System.out.println("loginname:");
		System.out.println(loginname);
		
		User u = new User();
		u.setUserId(userId);
		u.setLoginname(loginname);
		u.setPassword(password);
		
		try{
			userDao.updateUser(u);
			response.sendRedirect("success.jsp");
		}catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("error","更新失败" );
			response.sendRedirect("error.jsp");
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
