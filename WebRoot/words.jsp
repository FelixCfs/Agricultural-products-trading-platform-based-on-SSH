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
			<h1 class="sideTitle">联系我们</h1>
			<div class="sideNav">
				<ul>
					<li><a href="./Words.jsp" class="aNow">留言版</a></li>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<h1>留言版</h1>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</div>



			<!-- 显示开始 -->
			<table align="center" border="0"margin-top:auto; >
				<tr>
					<td width="60" align="center">姓名：</td>
					<td width="100">主题：</td>
					<td width="600">内容：</td>
				</tr>
				<jsp:useBean id="wordsDao" class="com.ap.dao.impl.WordsDaoImpl"></jsp:useBean>
				<c:set value="${wordsDao.allWords}" var="list" scope="session"></c:set>
				<c:forEach var="p" items="${list}" varStatus="s">
					<tr>
						<td>${p.name}</td>
						<td>${p.subject}</td>
						<td align="center">${p.message}</td>
					</tr>
					<tr>
						<td></td>
						<td>管理员回复</td>
						<td>${p.ret}</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 显示结束 -->
		</div>
	</div>
</div>
<span class="clear_f"></span>
<!--walEnd-->

<%@ include file="./front/foot.jsp"%>