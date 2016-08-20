
<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>

       <%
    	ProductDao pd=new ProductDaoImpl();
     %>
      <form  method="post" action="ProductAdd">
		  <body>
		    <table border="1" align="center">	
    	<tr>
    		<td style="width:80;word-break:break-all">产品编号:</td>
    		<TD ><input type ="text" name="productId"  style="width:350px;"  ></TD>
    	</tr>
    	<tr>
    		<td>产品名字:</td>
    		<td><input type ="text" name="productName" style="width:350px;"></td>
    	</tr>
    	<tr>
    		<td>产品类别:</td>
    		<td><input type ="text" name="bigcategory"  style="width:350px;"></td>
    	</tr>
    	<tr>
    		<td>产品简介:</td>
    		<td><input type ="text" name="introduce"  style="width:350px;"></td>
    	</tr>
    	<tr>
    		<td>图片:</td>
    		<td><input type ="text" name="imageFile"  style="width:350px;"></td>	
    	</tr>	
    	<tr>
    		<td>价格:</td>
    		<td>
    			<input type ="text" name="price"  style="width:350px;">
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" align="center"><input type ="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type ="reset" value="重置"></td>
    	</tr>			
    </table>
		  </body>
  	</form>
      
      
      
<%@ include file="./back/foot.jsp"%>