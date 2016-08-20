<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
    <%
    	String loginname=session.getAttribute("loginname").toString();
    	System.out.println("输出loginname"+loginname);
    	AdministratorDao ud=new AdministratorDaoImpl();
    	Administrator u = ud.getAdministratorByName(loginname);
    	session.setAttribute("loginname",loginname);
     %>
       <form  method="post" action="AdministratorUpd">
		  <body>
		 
		    <table border="1" align="center">	
    	<tr>
    		<td style="width:80;word-break:break-all">ID:</td>
    		<TD ><input type ="text" name="administratorId" value="<%=u.getAdministratorId() %>"   style="width:350px;" readonly></TD>
    	</tr>
    	<tr>
    		<td>用户名:</td>
    		<td><input type ="text" name="loginname" value="<%=u.getLoginname() %>"   style="width:350px;" readonly></td>
    	</tr>
    	
    	<tr>
    		<td>密码:</td>
    		<td><input type ="password" name="password" value="<%=u.getPassword() %>"   style="width:350px;"></td>
    	</tr>
    	<tr>
    		<td colspan="2" align="center"><input type ="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="reset" value="重置"></td>
    	</tr>			
    </table>
		  </body>
  	</form>
  	
<%@ include file="./back/foot.jsp"%>