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

import com.ap.dao.ProductDao;
import com.ap.dao.impl.ProductDaoImpl;
import com.ap.entity.Product;

public class ProductUpd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductUpd() {
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
	       
		ProductDao productDao = (ProductDao)context.getBean("productDao");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession(false);
		
		request.getAttribute("name") ;
		int productId=Integer.parseInt(request.getParameter("productId"));
		String productName=request.getParameter("productName");
		String introduce=request.getParameter("introduce");
		String bigcategory = request.getParameter("bigcategory");
		double price=Double.parseDouble(request.getParameter("price"));
		
		Product p = new Product();
		p.setProductId(productId);
		p.setProductName(productName);
		p.setBigcategory(bigcategory);
		p.setIntroduce(introduce);
		p.setPrice(price);
		
		
		try{
			boolean f = productDao.updateProduct(p);
			
			if (f){
				response.sendRedirect("ProductManager.jsp");
			}else{
				session.setAttribute("error","更新失败" );
				response.sendRedirect("error.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
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
