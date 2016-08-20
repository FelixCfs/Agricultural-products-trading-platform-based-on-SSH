<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./front/header.jsp"%>
<!--  在翻译阶段执行 -->
<jsp:include page="./front/body.jsp" flush="true" /><!--  在请求处理阶段执行-->

<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>

<div class="pageBanner" style="background:url(./image/up0924643001385538782.jpg) center top no-repeat;"></div>

<div class="pageBg">
<div class="wal">
<!--wal-->
<div class="fl w245">      
      	  <h1 class="sideTitle">账户管理</h1>
	  <div class="sideNav">
            <ul>
					<li><a href="./AccountMan.jsp" class="aNow">修改密码</a></li>
			</ul>
            <span class="clear_f"></span>
      </div>
</div>
<div class="fr w753">
	      <div class="pageTitle">
            <h1>修改密码</h1>
      </div>

    <%
    	String loginname=session.getAttribute("loginname").toString();
    	System.out.println("输出loginname"+loginname);
    	UserDao ud=new UserDaoImpl();
    	User u=new User();
    	u = ud.getUserByName(loginname);
    	session.setAttribute("loginname",loginname);
     %>
       <form  method="post" action="UserUpd">
		  <body>
		    <table border="1" align="center">	
    	<tr>
    		<td style="width:80;word-break:break-all">ID:</td>
    		<TD ><input type ="text" name="userId" value="<%=u.getUserId() %>"   style="width:350px;" readonly></TD>
    	</tr>
    	<tr>
    		<td>用户名:</td>
    		<td><input type ="text" name="loginname" value="<%=u.getLoginname() %>"   style="width:350px;" ></td>
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
<span class="clear_f"></span>
<!--walEnd-->
</div>
</div>
</div>

<%@ include file="./front/foot.jsp"%>