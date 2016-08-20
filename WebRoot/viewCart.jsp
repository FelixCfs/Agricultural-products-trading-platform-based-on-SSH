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
			<h1 class="sideTitle">关于AP</h1>
			<div class="sideNav">
				<ul>
					<li><a href="./ProductList.jsp" class="aNow">所有产品</a></li>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<h1>购物车详情</h1>
			</div>
			<!-- 显示开始 -->
			<table width="613" border="1" align="center">
				<tr>
					<td><div align="center">商品名称</div></td>
					<td><div align="center">商品数量</div></td>
					<td><div align="center">商品价格</div></td>
					<td><div align="center">总价</div></td>
				</tr>
				<c:forEach var="ci" items="${sessionScope.cart}" varStatus="cis">
					<c:set var="price" value="${ci.value.product.price}"></c:set>
					<c:set var="quality" value="${ci.value.quality}"></c:set>
					<c:set var="totalPrice" value="${quality*price}"></c:set>
					<c:set var="title" value="${ci.value.product.productName}"></c:set>
					<c:set var="purchased" value="${purchased}${title}" scope="session"></c:set>
					<c:set var="totalMoney" value="${totalMoney+totalPrice}"
						scope="session"></c:set>
					<tr>
						<td><div align="center">${title}</div></td>
						<td><div align="center">${quality}</div></td>
						<td><div align="center">${price}</div></td>
						<td><div align="center">${totalPrice}</div></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3"><div align="right">总计：</div></td>
					<td><div align="center">${totalMoney }</div></td>
				</tr>
			</table>
			<div>
				<a href="ProductList.jsp">继续购物</a> <br />
				<% if (session.getAttribute("loginname")==null){ %><a href="UserLogin.jsp">结账</a>
				<%}else{%><a href="./passOrder.jsp">结账</a><%} %>
			</div>
			<!-- 显示结束 -->

		</div>
	</div>
</div>
<span class="clear_f"></span>
<!--walEnd-->

<%@ include file="./front/foot.jsp"%>