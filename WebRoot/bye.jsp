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
			<h1 class="sideTitle">AP商品</h1>
			<div class="sideNav">
				<ul>
					<li><a href="./ProductDetail.jsp" class="aNow">商品详情</a></li>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<h1>商品详情</h1>
			</div>

			<BR>
			<h3>您的消费金额为：${sessionScope.totalMoney}</h3>
			<h3>您的账户余额为：${sessionScope.balance}</h3>
			<h3>${sessioScope.success}</h3>
			<h3>
				<a href="ProductList.jsp">继续购物</a>
			</h3>
			<br>
		</div>
	</div>
</div>

<span class="clear_f"></span>
<!--walEnd-->

<%@ include file="./front/foot.jsp"%>