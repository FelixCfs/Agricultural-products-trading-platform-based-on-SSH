<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./front/header.jsp"%>
<!--  在翻译阶段执行 -->
<jsp:include page="./front/body.jsp" flush="true" /><!--  在请求处理阶段执行-->

<div class="pageBanner"
	style="background: url(./image/up0924643001385538782.jpg) center top no-repeat;"></div>
<div class="pageBg">
	<div class="wal">
		<!--wal-->
		<div class="fl w245">
			<h1 class="sideTitle">收银台</h1>
			<div class="sideNav">
				<ul>
					<li><a href="./ProductDetail.jsp" class="aNow">收银台</a></li>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<h1>收银台</h1>
			</div>
			<br />
			<!-- 显示开始 -->
			<form method="POST" name="passOrder" action="orderServlet">
				<table>
					<tr>
						<h3>请填写用户信息</h3>
					</tr>
					<tr>
						<td>用户名:</td>
						<td>${sessionScope.loginname}</td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" name="phone" size="20" /></td>
					</tr>
					<tr>
						<td>购物的物品:</td>
						<td>${sessionScope.purchased}</td>
					</tr>
					<tr>
						<td>家庭住址:</td>
						<td><input type="text" name="address" size="20" /></td>
					</tr>
					<tr>
						<td>信用卡号:</td>
						<td><input type="text" name="card" size="20" /></td>
					</tr>
					<tr>
						<td>消费金额为：</td>
						<td>${sessionScope.totalMoney}</td>
					</tr>
					<tr>
						<td><input type="submit" value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" value="重置" /></td>
					</tr>
				</table>
			</form>
			<c:set var="purchased1" value="${sessionScope.purchased}"
				scope="session"></c:set>
			<% session.removeAttribute("purchased"); %>
			<!-- 显示结束 -->
		</div>
	</div>
</div>
<span class="clear_f"></span>
<!--walEnd-->

<%@ include file="./front/foot.jsp"%>