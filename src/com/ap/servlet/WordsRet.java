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

import com.ap.dao.WordsDao;
import com.ap.dao.impl.WordsDaoImpl;

public class WordsRet extends HttpServlet {
	public WordsRet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ApplicationContext context = 
	               new ClassPathXmlApplicationContext(new String[] {"SpringBeans.xml"});
	       
		WordsDao wordsDao = (WordsDao)context.getBean("wordsDao");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession(false);
		
		int wordsId=Integer.parseInt(request.getParameter("wordsId"));
		String ret= request.getParameter("ret");
		
		try{
			
			wordsDao.addWordsRet(ret,wordsId);
			
			response.sendRedirect("WordsManager.jsp");
			
		}catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("error","����ʧ��" );
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

	public void init() throws ServletException {
	}

}
