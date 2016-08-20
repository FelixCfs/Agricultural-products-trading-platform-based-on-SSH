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
import com.ap.dao.WordsDao;
import com.ap.dao.impl.WordsDaoImpl;
import com.ap.entity.Words;

public class WordsAdd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WordsAdd() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		WordsDao wordsDao = (WordsDao)context.getBean("wordsDao");
		 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);

		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		Words n = new Words();
		n.setName(name);
		n.setSubject(subject);
		n.setMessage(message);

		try {

			wordsDao.addWords(n);
			response.sendRedirect("words.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			session.setAttribute("error", "添加失败");
			response.sendRedirect("error.jsp");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			doGet(request, response);
		} catch (IOException e) {

			e.printStackTrace();
		} 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
