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
import com.ap.dao.UserDao;
import com.ap.dao.impl.ProductDaoImpl;
import com.ap.entity.Product;

public class ProductAdd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductAdd() {
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
	       
		ProductDao productDao = (ProductDao)context.getBean("productDao");
		 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession(false);

		int productId=Integer.parseInt(request.getParameter("productId"));
		String productName=request.getParameter("productName");
		String introduce=request.getParameter("introduce");
		String bigcategory = request.getParameter("bigcategory");
		String imageFile=request.getParameter("imageFile");
		double  price=Double.parseDouble(request.getParameter("price"));
		
		Product p =new Product();
		p.setProductId(productId);
		p.setProductName(productName);
		p.setBigcategory(bigcategory);
		p.setIntroduce(introduce);
		p.setImageFile(imageFile);
		p.setPrice(price);
		
		try{
			productDao.addProduct(p);
			response.sendRedirect("ProductManager.jsp");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.setAttribute("error","添加失败" );
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
