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
			<h1 class="sideTitle">提示</h1>
		</div>
		<div class="fr w753">
			<div class="pageTitle">
				<br />
				<h1>注销成功，3秒钟之后自动跳转到主页......</h1>
				<%
					response.setHeader("refresh", "3;url=index.jsp");
					session.setAttribute("loginname", null);
				%>
			</div>
		</div>
		<div class="footDiv">
			<div class="wal">
				<div class="fl">
					<a
						href="#"
						target="_blank">京ICP备09064618号</a> 版权所有：AP Copyright © M&amp;Y
					2001-2013. All Rights Reserved.
				</div>
				<div class="fl" style="padding-left: 100px;">服务热线：400123456</div>
				<div class="fr">
					<a href="javascript:;" class="footMapA">网站地图</a> | <a
						href="#">法律声明</a> | <a
						href="#">联系我们</a>
				</div>
				<div class="fr imgDiv">
					<a href="http://weibo.com/ "
						target="_blank"><img src="./image/limg29_1.png"></a><a
						href="javascript:;" class="ewmA"><img
						src="./image/limg29_2.png"></a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="ewmLayer">
	<img src="./image/up0255256001385532459.jpg" alt="" width="94"
		height="94">
</div>
<script type="text/javascript">
	$(function() {
		$('.ewmA').hover(function() {
			$('.ewmLayer').css('left', $(this).offset().left - 30);
			$('.ewmLayer').css('top', $(this).offset().top - 120);
			$('.ewmLayer').show();
		}, function() {
			$('.ewmLayer').hide();
		})
		$('.ewmLayer').hover(function() {
			$('.ewmLayer').show();
		}, function() {
			$('.ewmLayer').hide();
		})
	})
</script>

<div style="display: none;">
	<script type="text/javascript">
		var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://"
				: " http://");
		document
				.write(unescape("%3Cscript src='"
						+ _bdhmProtocol
						+ "hm.baidu.com/h.js%3Fa69d19e6b0f8a25d0dc619e6138574d3' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script src="./style/js/h.js" type="text/javascript"></script>
	<a
		href="http://tongji.baidu.com/hm-web/welcome/ico?s=a69d19e6b0f8a25d0dc619e6138574d3"
		target="_blank"><img border="0" src="./image/21.gif" width="20"
		height="20"></a>
</div>

<%@ include file="./front/foot.jsp"%>