<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
 
    
      <form >
     <Table border="0" align="center" >
    	<tr align="center">
    		<td>产品编号</td>
    		<td>产品名称</td>
    		<td width="40">类别</td>
    		<td width="80">简介</td>
    		<td>图片</td>
    		<td>价格</td> 
    		<td style="width:150;word-break:break-all">操作</td>      		
    	</tr >
    	<tr align="center">  	
    		 <jsp:useBean id="productDao" class="com.ap.dao.impl.ProductDaoImpl" ></jsp:useBean>
			 <c:set value="${productDao.allProduct}" var="list" scope="session"></c:set>
			 
			 <c:forEach var="p" items="${list}" varStatus="s">		
    		<c:if test="${s.index%1==0}"><!-- 3个一行显示 -->
				<tr align="center">
			</c:if>
			
				<td style="width:60;word-break:break-all">${p.productId}</td>
				<td>${p.productName}</td>
				<td>${p.bigcategory}</td>
				<td width="80">${p.introduce}</td>
				<td style="width:120;word-break:break-all">${p.imageFile}</td>
				<td>${p.getPrice()}</td>
				<td>
		    		<a href="ProductDel?id=${p.productId}">删除</a> &nbsp;&nbsp;
	    		 	<a href="UpdateProduct.jsp?id=${p.productId}">更改</a>
	    		</td>
		    	<c:if test="${s.index%1==1}">
					</tr>
				</c:if>		
			</c:forEach>			
			
    	</tr>
    	<tr  >
    		<td colspan="6">
    			<center><strong><a href="AddProduct.jsp">添加新的产品</a></strong></center>
    		</td>
    	 </tr>
    </Table>   
 </form>      
      
      
 </div>
<%@ include file="./back/foot.jsp"%>