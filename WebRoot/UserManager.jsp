<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
      
      
  <form >
     <Table border="0" align="center" >
    	<tr align="center">
    	 	<td style="width:80;word-break:break-all">编号:</td>
    		<td style="width:80;word-break:break-all">用户名:</td>
    		<td style="width:80;word-break:break-all">密码:</td>
    		<td style="width:150;word-break:break-all"><center>操作</center></td>      		
    	</tr>
    	<tr align="center">  	
    		 <jsp:useBean id="userDao" class="com.ap.dao.impl.UserDaoImpl" ></jsp:useBean>
			 <c:set value="${userDao.allUser}" var="list" scope="session"></c:set>
			 
			 <c:forEach var="ud" items="${list}" varStatus="s">		
    		<c:if test="${s.index%1==0}"><!-- 3个一行显示 -->
				<tr>
			</c:if>
			
				<td style="width:40;word-break:break-all" align="center">${ud.userId}	</td>
				<td style="width:40;word-break:break-all"  align="center">${ud.loginname}</td>
				<td style="width:40;word-break:break-all" align="center">${ud.password}</td>
				<td style="width:40;word-break:break-all" align="center">
	    		<a href="UserDel?userId=${ud.userId}">删除</a> &nbsp;&nbsp;	    			 
	    		</td>
		    	<c:if test="${s.index%1==1}">
					</tr>
				</c:if>		
			</c:forEach>			
			
    	</tr>
    	
    </Table>   
 </form>      
      
      
		
</div>
<%@ include file="./back/foot.jsp"%>