<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="topDiv">

		<div class="wal">

			<div class="fl nav">
				<ul>
					<li><a href="./index.jsp">首页</a></li>
					<li><a href="./AboutUs.jsp">关于AP</a></li>
					<li><a href="./LeaveWords.jsp">联系我们</a></li>
				</ul>
			</div>

			<div class="fr topLanguage" style="float: left;">
				<button id="displayBtn" style="margin-top: 9px; display: none;">登录
					注册</button>
				<button id="displayBtn2"
					style="margin-top: 9px; display: block; color: #D8D8D8; background-color: #0C8264; background-color: Transparent; border-color: Transparent; border-style: None;">
					欢迎用户:<%=session.getAttribute("loginname")%>
				</button>
			</div>

			<div style="float: left; margin-left: 9px; margin-top: 2px">
				<button id="logout"
					style="margin-top: 9px; margin-right: 10px; display: block; color: #D8D8D8; background-color: #0C8264; background-color: Transparent; border-color: Transparent; border-style: None;">注销
				</button>
			</div>

			<script>
				document.getElementById('displayBtn').addEventListener('click',
						function() {
							window.location.href = 'UserLogin.jsp';
						}, false);
				document.getElementById('logout').addEventListener('click',
						function() {
							window.location.href = 'logout.jsp';
						}, false);
				function subform(i) {
					var theform = document.search;
					var k = theform.keyword.value;
					theform.action = './?' + i + '/keyword/' + encodeURI(k) + '.html';
					theform.submit();
				}
				//判断用户是否登录按钮显示
				window.onload = function DisplayAndHiddenHerf(displayBtn) {
					var loginname =<%=session.getAttribute("loginname")%>;
					//alert("获取到的字段:"+loginname);
					var currentBtn = document.getElementById("displayBtn");
					var currentBtn2 = document.getElementById("displayBtn2");
					var currentBtn3 = document.getElementById("logout");
					if (loginname != null) {
						currentBtn.style.display = "none"; //style中的display属性        
					} else {

						currentBtn.style.display = "block";
						currentBtn2.style.display = "none";
						currentBtn3.style.display = "none";
					}

				}
			</script>

			<div class="fr topSearch">
				<div align="right">
					<form method="post" action="FProductList.jsp">
						<input type="text" id="productName" name="productName"
							placeholder="请输入要查找的商品">
						<button type="submit">提交</button>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div class="headDiv">
		<div class="wal">
			<a href="./index.jsp" class="logo"><img src="./image/logo.png"></a>
			<span class="clear_f"></span>
			<div class="list">
				<ul>
					<li class="li_01"><a href="ProductList.jsp" class="">商品展示</a></li>
					<li class="li_02"><a href="viewCart.jsp">购物车</a></li>
					<li class="li_03" id="fastLink">
						<% if (session.getAttribute("loginname")==null) {%><a
						href="UserLogin.jsp">个人信息管理</a> <% } else {%><a href="AccountMan.jsp">个人信息管理</a><%} %>
					</li>
					<li class="li_04"><a href="words.jsp">留言薄</a></li>
				</ul>
				<%if(session.getAttribute("loginname")==null){ %>
				<script>
			          $('#fastLink').mouseover(function(){$('#loginNav').style.display="none";});
			        </script>
				<%} else {} %>
			</div>
		</div>
	</div>

	<div class="sNav" style="width: 180px; left: 520.5px; display: none;">
		<ul>
			<li><a href="ProductList.jsp">所有商品</a></li>
		</ul>
	</div>
	<div class="sNav" style="display: none;">
		<ul>
		</ul>
	</div>
	<div class="sNav" id="loginNav" style="display: none;">
		<ul>
			<li><a href="AccountMan.jsp">修改账户密码</a></li>
		</ul>
	</div>
	<script type="text/javascript">
$(function(){
	$('.nav').find('a').eq(0).addClass('aNow');
	})
</script>