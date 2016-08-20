<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./back/head.jsp"%>
      <form >
     <Table border="0" align="center" >
    	<tr align="center">
    		<td>产品编号</td>
    		<td width="50">产品名称</td>
    		<td>类别</td>
    		<td>简介</td>
    		<td style="width:150;word-break:break-all">操作</td>      		
    	</tr >
    	<tr align="center">  	
    		 <jsp:useBean id="wordsDao" class="com.ap.dao.impl.WordsDaoImpl" ></jsp:useBean>
			 <c:set value="${wordsDao.allWords}" var="list" scope="session"></c:set>
			 
			 <c:forEach var="p" items="${list}" varStatus="s">		
    		<c:if test="${s.index%1==0}"><!-- 3个一行显示 -->
				<tr align="center">
			</c:if>
			
				<td style="width:60;word-break:break-all">${p.wordsId}</td>
				<td>${p.name}</td>
				<td>${p.subject}</td>
				<td >${p.message}</td>
				<td>
		    		<a href="WordsDel?wordsId=${p.wordsId}">删除</a> &nbsp;&nbsp;
		    		<a href="AddWordsRet.jsp?wordsId=${p.wordsId}">回复</a> &nbsp;&nbsp;
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