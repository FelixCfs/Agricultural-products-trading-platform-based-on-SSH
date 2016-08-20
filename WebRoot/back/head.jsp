<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<title>AP--中国领先农产品电子商品平台</title>
<link href="./style/css/main.css" rel="stylesheet" type="text/css">
<link href="./style/css/index.css" rel="stylesheet" type="text/css">
<link href="./style/css/table.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="./style/js/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="./style/js/js.js"></script>
<script language="javascript" type="text/javascript" src="./style/js/fun.js"></script>
<script language="javascript" type="text/javascript" src="./style/js/form.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>	
<![endif]--> 
</head>

<body>
<div class="topDiv">
<div class="wal">
     <div class="fl nav">
           <ul>
              <li><a href="./index.jsp">首页</a></li>
           </ul>
     </div>
     <div class="fr topLanguage" style="float:left;">
     	<button id="displayBtn"  style="margin-top:9px; display:none;" >登录  注册</button>	     	
    	<button id="displayBtn2"  style="margin-top:9px; display:block; color: #D8D8D8;background-color:#0C8264;background-color:Transparent;border-color:Transparent;border-style:None;" >欢迎用户:<%=session.getAttribute("loginname")%> </button>
     </div>
     <div style="float:left;margin-left:9px;margin-top:2px">
     	<button id="logout"  style="margin-top:9px; margin-right:10px;display:block; color: #D8D8D8;background-color:#0C8264;background-color:Transparent;border-color:Transparent;border-style:None;" >注销 </button>     		
     </div>
	 <script>
	 document.getElementById('displayBtn').addEventListener('click', function() {window.location.href = 'UserLogin.jsp';}, false);  
	 document.getElementById('logout').addEventListener('click', function() {window.location.href = 'logout.jsp';}, false);  
	   function subform(i) 
		{ 
		var theform = document.search;
		var k = theform.keyword.value;
		theform.action = './?'+i+'/keyword/'+encodeURI(k)+'.html'; 
		theform.submit();
		} 
		//判断用户是否登录按钮显示
		window.onload=function DisplayAndHiddenHerf(displayBtn) {	
		var loginname=<%=session.getAttribute("loginname")%>;
		//alert("获取到的字段:"+loginname);
	    var currentBtn = document.getElementById("displayBtn");
	    var currentBtn2 = document.getElementById("displayBtn2");
	    var currentBtn3 = document.getElementById("logout");
    	if (loginname!=null) {
       		 currentBtn.style.display = "none"; //style中的display属性        
  	    }    
   	 	else{
  		
        currentBtn.style.display = "block"; 
        currentBtn2.style.display = "none";
        currentBtn3.style.display="none";
    	}
	
		
	}
	  </script>
     <div class="fr topSearch">
     </div>
</div>
</div>

<div class="headDiv">
<div class="wal">
     <a href="./index.jsp" class="logo"><img src="./image/logo.png"></a>
     <span class="clear_f"></span>
     <div class="list">
			          <%if(session.getAttribute("loginname")==null){
			          %>
			          <script>
			          $('#fastLink').mouseover(function(){$('#loginNav').style.display="none";});
			          
			          </script>
			          <%
			          } %>
     </div>
</div>
</div>

<div class="sNav" style="display: none;">
      <ul>
      </ul>
</div>
<script type="text/javascript">
$(function(){
	$('.nav').find('a').eq(1).addClass('aNow');
	})
</script>

<div class="pageBanner" style="background:url(./image/up0924643001385538782.jpg) center top no-repeat;"></div>
<div class="pageBg">
<div class="wal">
<!--wal-->
<div class="fl w245">      
      	  <h1 class="sideTitle">管理员操作</h1>
	  <div class="sideNav">
            <ul>
           			 <li><a href="./AdManager.jsp">管理员管理</a></li>	
					 <li><a href="./ProductManager.jsp" >商品管理</a></li>
					<li><a href="./WordsManager.jsp">留言管理</a></li>	
					<li><a href="./UserManager.jsp">会员管理</a></li>	
					<li><a href="./AdPasswordMan.jsp">密码管理</a></li>				       
			 </ul>
            <span class="clear_f"></span>
      </div>
</div>
<div class="fr w753">
	      <div class="pageTitle">
            <h1>欢迎管理员：<%=session.getAttribute("loginname")%> </h1>
      </div>