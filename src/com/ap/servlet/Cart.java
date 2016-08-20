package com.ap.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ap.entity.CartItem;
import com.ap.entity.Product;


public class Cart extends HttpServlet {

	public Cart() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();

		HttpSession session =request.getSession(false);

		Map cart=(Map) session.getAttribute("cart");
		
		if(cart==null){
			cart=new HashMap();
			session.setAttribute("cart", cart);
		}
		
		Product p=(Product)session.getAttribute("producttoadd");
		
		CartItem ci=(CartItem)cart.get(p.getProductId());
		
		if(ci!=null){
			
			ci.setQuality(ci.getQuality()+1);
			
			}else{
				
				cart.put(p.getProductId(), new CartItem(p,1));
				
			}
		
		session.setAttribute("cart",cart);
		request.getRequestDispatcher("viewCart.jsp").forward(request, response);	
		
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
