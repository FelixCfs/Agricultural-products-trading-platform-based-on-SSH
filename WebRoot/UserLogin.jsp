<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.ap.dao.*"%>
<%@page import="com.ap.dao.impl.*"%>
<%@page import="com.ap.entity.*"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>用户登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="./style/css/reset.css">
        <link rel="stylesheet" href="./style/css/supersized.css">
        <link rel="stylesheet" href="./style/css/loginstyle.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container">
            <h1>用户登录</h1>
            <form action="UserChk" method="post">
                <input type="text" name="loginname" class="loginname" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit">提交</button>                 
                <div class="error"><span>+</span></div>
            </form>
            <button  id="regBtn" style="display:block;background-color:#348652;margin-left:auto;margin-right: auto;">注册</button>
<script type="text/javascript">
    document.getElementById('regBtn').addEventListener('click', function() {window.location.href = 'UserReg.jsp';}, false);  
</script> 
 			<button  id="adBtn" style="display:block;background-color:#0A9BED;margin-left:auto;margin-right: auto;">管理员登陆</button>
<script type="text/javascript">
    document.getElementById('adBtn').addEventListener('click', function() {window.location.href = 'AdLogin.jsp';}, false);  
</script> 
            <div class="connect">
                <p>Or connect with:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="./style/js/jquery-1.8.2.min.js"></script>
        <script src="./style/js/supersized.3.2.7.min.js"></script>
        <script src="./style/js/supersized-init.js"></script>
        <script src="./style/js/scripts.js"></script>




    <!-- 
      
      <form  method="post" action="UserAdd">
		  <body>
		 
		    <table border="1" align="center">	
    	<tr>
    		<td style="width:80;word-break:break-all">用户编号:</td>
    		<TD ><input type ="text" name="UserId"  style="width:350px;"  ></TD>
    	</tr>
    	<tr>
    		<td>用户名:</td>
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
		  </body>
  	</form>
 -->  	
          </body>
</html>
      
      
      
      
      
      