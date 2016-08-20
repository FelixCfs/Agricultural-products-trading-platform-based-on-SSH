<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./front/header.jsp"%>
<!--  在翻译阶段执行 -->
<jsp:include page="./front/body.jsp" flush="true" /><!--  在请求处理阶段执行-->


<div class="indexFlash">
	<ul>
		<li><a
			style="left: 0px; background: url(../../AgriProductsEcp/image/up1.jpg) 50% 0% no-repeat;"></a></li>
		<li><a
			style="left: 100%; background: url(../../AgriProductsEcp/image/up2.jpg) 50% 0% no-repeat;"></a></li>
		<li><a
			style="left: 100%; background: url(../../AgriProductsEcp/image/up3.jpg) 50% 0% no-repeat;"></a></li>
		<li><a
			style="left: 100%; background: url(../../AgriProductsEcp/image/up4.jpg) 50% 0% no-repeat;"></a></li>
		<li><a
			style="left: -100%; background: url(../../AgriProductsEcp/image/up5.jpg) 50% 0% no-repeat;"></a></li>
	</ul>
	<div class="bg"></div>
	<a href="javascript:;" class="leftBtn"
		style="display: none; left: 173.5px;"></a> <a href="javascript:;"
		class="rightBtn" style="display: none; right: 173.5px;"></a>
</div>

<div class="indexPart">
	<div class="wal">
		<div class="fl indexPart_01">
			<div class="indexTitle">
				<b>新品上架</b><span>News</span><a href="" target="_blank" class="more">+more</a>
			</div>
			<br />
			<div class="contentDiv">
				<div class="imgDiv">
					<a href="ProductDetail.jsp?productId=201630"><img
						src="./image/caomei.jpg" alt=""></img></a>
				</div>
			</div>
		</div>
		<div class="fl indexPart_02">
			<div class="indexTitle">
				<b>关于AP</b><span>About us</span><a href="AboutUs.jsp" " class="more">+more</a>
			</div>
			<div class="contentDiv">
				<div class="imgDiv">
					<a href="AboutUs.jsp"> <img
						src="./image/up0973453001385458372.jpg" alt=""></a>
				</div>
				<div class="content">AP生态农业有限公司成立于2002年，是国内成立较早、规模较大的农产品提供商，始终坚持为中...</div>
			</div>
		</div>
		<div class="fr indexPart_03">
			<div class="indexTitle">
				<b>移动端应用下载</b><span>DownLoads</span><a href="" class="more"></a>
			</div>
			<div class="contentDiv">
				<div class="imgDiv">
					<img src="./image/store.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="./front/foot.jsp"%>