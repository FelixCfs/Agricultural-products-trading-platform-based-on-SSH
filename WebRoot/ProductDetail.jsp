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
			<form method="post" name="detail" action="Cart">
				<c:set value="${sessionScope.list}" var="list"></c:set>
				<c:set value="${param.productId}" var="productId"></c:set>
				<c:forEach var="p" items="${list}" varStatus="s">
					<c:if test="${p.productId eq param.productId}">
						<c:set value="${p}" var="producttoadd" scope="session"></c:set>
						<TABLE width="609" border="1">
							<tr>
								<td colspan="3">
									<div align="center">
										<h1>
											<font color="red">${p.productName}
										</h1>
									</div>
								</td>
							</tr>
							<tr>
								<td width="140" colspan="3">
									<div align="center">
										<img src=" ./image/${p.imageFile}" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="200">
									<div align="center">商品编号：</div>
								</td>
								<td width="200 ">
									<div align="center">${p.productId}</div>
								</td>
							</tr>
							<tr>
								<td width="200">
									<div align="center">商品名称：</div>
								</td>
								<td width="200 ">
									<div align="center">${p.productName}</div>
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">商品简介：</div>
								</td>
								<td>
									<div align="center">${p.introduce}</div>
								</td>
							</tr>
							<tr>
								<td>
									<div align="center">商品价格</div>
								</td>
								<td>
									<div align="center">${p.price}</div>
								</td>
							</tr>
							<tr>
								<td height="24">
									<div align="center">
										<input type="submit" value="放入购物车">
									</div>
								</td>
								<td><div align="center">
										<a href="viewCart.jsp">查看购物车</a>
									</div></td>
							</tr>
						</TABLE>
					</c:if>
				</c:forEach>
			</form>
		</div>
	</div>
</div>
<%@ include file="./front/foot.jsp"%>