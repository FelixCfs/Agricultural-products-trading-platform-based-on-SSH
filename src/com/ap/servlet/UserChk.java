package com.ap.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ap .dao.UserDao;
import com.ap.entity.User;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserChk extends HttpServlet {

    
	/**
	 * Constructor of the object.
	 */
	public UserChk() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		  // TODO Auto-generatedmethod stub 
	       super.init(config); 
	      
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
	       
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String loginname =request.getParameter("loginname");
		System.out.println(loginname);
		int password =Integer.parseInt(request.getParameter("password"));
		User u=new User();
		u.setLoginname(loginname);
		u.setPassword(password);
		boolean flag=userDao.checkUser(u);		
		if(flag==true){		
			HttpSession session =request.getSession();	
			session.setAttribute("loginname", loginname);	
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else{
			HttpSession session =request.getSession();	
			session.setAttribute("error", "�û����������");			
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
