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

import com.ap.biz.AccountBiz;
import com.ap.biz.impl.AccountBizImpl;
import com.ap.dao.AccountDao;
import com.ap.dao.OrderDao;
import com.ap.dao.UserDao;
import com.ap.dao.impl.AccountDaoImpl;
import com.ap.dao.impl.OrderDaoImpl;
import com.ap.entity.IOrder;

public class orderServlet extends HttpServlet {

	public orderServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		OrderDao orderDao = (OrderDao)context.getBean("orderDao");
		AccountDao accountDao = (AccountDao)context.getBean("accountDao");
		 
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		String loginname=(String) session.getAttribute("loginname");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String card=request.getParameter("card");
		
		IOrder order=new IOrder();
		
		order.setLoginname(loginname);
		order.setPhone(phone);
		order.setAddress(address);
		order.setCreditCard(card);
		order.setTotal((Double) session.getAttribute("totalMoney"));	
		order.setPurchased((String)session.getAttribute("purchased1"));
		
		
		boolean flag;
		flag=orderDao.insertOrder(order);

		if(flag){
			
			session.setAttribute("balance", accountDao.SelectBalance(card));
			session.setAttribute("success", "插入成功");			
			response.sendRedirect("bye.jsp");
			
		}else{
			
			session.setAttribute("balance", accountDao.SelectBalance(card));
		    session.setAttribute("error", "插入失败");
			response.sendRedirect("error.jsp");
			
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
