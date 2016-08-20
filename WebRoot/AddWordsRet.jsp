<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>

           <form  method="post" action="WordsRet">
		  <body>
		    <table border="1" align="center">	
		    	<tr>
		    		<td>留言Id:</td>
		    		<td>
		    			<input type ="text" name="wordsId"  style="width:350px;" value=<%=request.getParameter("wordsId") %> readonly>
		    		</td>
		    	</tr>
		    	<tr>
		    		<td>输入回复:</td>
		    		<td>
		    			<input type ="text" name="ret"  style="width:350px;">
		    		</td>
		    	</tr>
		    	<tr>
		    		<td colspan="2" align="center"><input type ="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="reset" value="重置"></td>
		    	</tr>			
    </table>
		  </body>
  	</form>
  	
<%@ include file="./back/foot.jsp"%>