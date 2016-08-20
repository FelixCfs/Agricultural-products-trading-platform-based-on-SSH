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
			<h1 class="sideTitle">所有分类</h1>
			<div class="sideNav">
				<ul>
					<jsp:useBean id="productDao1"
						class="com.ap.dao.impl.ProductDaoImpl"></jsp:useBean>
					<c:set value="${productDao1.allBigcategory}" var="list"
						scope="session"></c:set>
					<c:forEach var="b" items="${list}" varStatus="s">
						<li><a href="./CProductList.jsp?bigcategory=${b.bigcategory}"
							class="aNow">${b.bigcategory}</a></li>
					</c:forEach>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<div>
					<h1>产品列表</h1>
				</div>
				<div align="right">
					<form method="post" action="FProductList.jsp">
						<input type="text" id="productName" name="productName"
							placeholder="请输入查找内容">
						<button type="submit">提交</button>
					</form>
				</div>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</div>
			<TABLE cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff border=0>
				<TBODY>
					<TR>
						<TD vAlign=top align=middle width=610><BR> <!-- 显示开始 -->
							<table align="center" border="0">
								<%
									request.setCharacterEncoding("UTF-8");
								%>
								<jsp:useBean id="productDao"
									class="com.ap.dao.impl.ProductDaoImpl"></jsp:useBean>
								<c:set value="${productDao.allProduct}" var="list"
									scope="session"></c:set>
								<c:forEach var="p" items="${list}" varStatus="s">
									<c:if test="${s.index%3==0}">
										<!-- 3个一行显示 -->
										<tr>
									</c:if>
									<td>
										<table width="180" border="1">
											<tr>
												<td><a
													href="ProductDetail.jsp?productId=${p.productId}">产品编号：${p.productId}</a>
												</td>
											</tr>
											<tr>
												<td><c:choose>
														<c:when test="${fn:length(p.productName)}<20">
										产品名称：${p.productName}
									</c:when>
														<c:otherwise>
										产品名称：${fn:substring(p.productName,0,9)}
									</c:otherwise>
													</c:choose></td>
											</tr>
											<tr>
												<td><img src="./image/${p.imageFile}" /></td>
											</tr>

										</table>
									</td>
									<c:if test="${s.index%3==2}">
										</tr>
									</c:if>
								</c:forEach>
								<tr>
									<td border="1"></td>
								</tr>
							</table> <!-- 显示结束 --> <br></TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>
</div>
<%@ include file="./front/foot.jsp"%>