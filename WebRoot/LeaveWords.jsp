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
					<li><a href="./ProductList.jsp" class="aNow">联系我们</a></li>
				</ul>
				<span class="clear_f"></span>
			</div>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<h1>填写留言</h1>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			</div>
			<!-- 显示开始 -->
			<form method="post" action="WordsAdd">
				<body>

					<table border="1" align="center">
						<tr>
							<td width="70">姓名:</td>
							<td><input type="text" name="name" style="width: 350px;"></td>
						</tr>
						<tr>
							<td>主题:</td>
							<td><input type="text" name="subject" style="width: 350px;"></td>
						</tr>
						<tr>
							<td>正文:</td>
							<td><textarea rows="3" cols="20" name="message"
									style="width: 350px; height: 100px;"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="reset" value="重置"></td>
						</tr>
					</table>
				</body>
			</form>
			<!-- 显示结束 -->
		</div>
	</div>
</div>
<span class="clear_f"></span>
<!--walEnd-->

<%@ include file="./front/foot.jsp"%>