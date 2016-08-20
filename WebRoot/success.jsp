<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./front/header.jsp" %> <!--  在翻译阶段执行 -->
<jsp:include page="./front/body.jsp" flush="true" /><!--  在请求处理阶段执行-->
<div>
  	<h3>修改成功，3秒钟之后自动跳转到登陆页面......</h3>
<%
	response.setHeader("refresh","3;url=index.jsp");
%>
</div>
<%@ include file="./front/foot.jsp"%>