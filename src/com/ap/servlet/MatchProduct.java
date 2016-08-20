package com.ap.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ap.dao.ProductDao;
import com.ap.dao.impl.ProductDaoImpl;

public class MatchProduct extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MatchProduct() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession(false);
		
		String productName=request.getParameter("productName");
		
		ProductDao pd =new ProductDaoImpl();
		
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
