<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
      
<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>
      
      
       <%
    	AdministratorDao ad=new AdministratorDaoImpl();
     %>
      <form  method="post" action="AdministratorAdd">
		    <table border="1" align="center">	
		    	<tr>
		    		<td>登录名:</td>
		    		<td><input type ="text" name="loginname" style="width:350px;"></td>
		    	</tr>
		    	<tr>
		    		<td>密码:</td>
		    		<td><input type ="text" name="password"  style="width:350px;"></td>
		    	</tr>
		    	<tr>
		    		<td colspan="2" align="center"><input type ="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="reset" value="重置"></td>
		    	</tr>			
   		 </table>
  	</form>
      
<%@ include file="./back/foot.jsp"%>
      