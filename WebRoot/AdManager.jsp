<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
      
      
      <BODY>
  <form >
     <Table border="0" align="center" >
    	<tr align="center">
    	 	<td style="width:80;word-break:break-all">编号:</td>
    		<td style="width:80;word-break:break-all">用户名:</td>
    		<td style="width:80;word-break:break-all">密码:</td>
    		<td style="width:150;word-break:break-all"><center>操作</center></td>      		
    	</tr>
    	<tr align="center">  	
    		 <jsp:useBean id="administratorDao" class="com.ap.dao.impl.AdministratorDaoImpl" ></jsp:useBean>
			 <c:set value="${administratorDao.allAdministrator}" var="list" scope="session"></c:set>
			 
			 <c:forEach var="ud" items="${list}" varStatus="s">		
    		<c:if test="${s.index%1==0}"><!-- 3个一行显示 -->
				<tr>
			</c:if>
			
				<td style="width:40;word-break:break-all" align="center">${ud.administratorId}	</td>
				<td style="width:40;word-break:break-all"  align="center">${ud.loginname}</td>
				<td style="width:40;word-break:break-all" align="center">${ud.password}</td>
				<td style="width:40;word-break:break-all" align="center">
	    		<a href="AdministratorDel?administratorId=${ud.administratorId}">删除</a> &nbsp;&nbsp;	    			 
	    		</td>
		    	<c:if test="${s.index%1==1}">
					</tr>
				</c:if>		
			</c:forEach>			
			
    	</tr>
    	<tr>
    	<td colspan="4">
    			<center><strong><a href="AddAd.jsp">添加新的管理员</a></strong></center>
    		</td>
    	</tr>
    </Table>   
 </form>      
      
      
		
</div>
      
<%@ include file="./back/foot.jsp"%>