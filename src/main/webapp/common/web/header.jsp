<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- header -->
<div>
	<div id="slide-banner" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
			<!-- <li data-target="#demo" data-slide-to="0" ></li> -->
			<c:forEach var="item" items="${newArts.listResult}">
				<li data-target="#demo" data-slide-to="${item.id}"
				<c:if test="${activeBanner == item.id}"> class="active"</c:if>
				></li>
			</c:forEach>
			
			<!-- <li data-target="#demo" data-slide-to="2"></li> -->
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<!-- <div class="carousel-item active">
				<img src="http://placehold.it/1024x320" alt="Los Angeles"
					class="centerBlock">
			</div> -->
			<c:forEach var="item" items="${newArts.listResult}">
				
					<a href='<c:url value="/newart/posts?code=${item.id}"/>'
						<c:if test="${activeBanner == item.id}"> class="carousel-item active"</c:if>
						<c:if test="${activeBanner != item.id}"> class="carousel-item"</c:if>
						>
						<img src='<c:url value="/images/${item.banner}"/>' alt="Chicago"
							class="centerBlock" width="1024px" height="320px">
					</a>
			</c:forEach>
			
			<!-- <div class="carousel-item">
				<img src="http://placehold.it/1024x320" alt="New York"
					class="centerBlock">
			</div> -->
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#slide-banner"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slide-banner"
			data-slide="next"> <span class="carousel-control-next-icon"></span>
		</a>
	</div>
</div>


<div class="centerBlock" style="padding: 5px;">
	<div class="row text-light menu-left">
		<div class="pull-right"
			style="width: 40%; padding-top: 64px; padding-bottom: 64px; padding-left: 15px; padding-right: 15px;">
			<div class="centerBlock menu-l-top">
				<a href='<c:url value="/home?page=1"/>' 
					<c:if test="${checkMenu == 0}"> class="text-danger"</c:if>
					<c:if test="${checkMenu != 0}"> class="text-light"</c:if>
				>HOME</a> | 
				<a href='<c:url value="/bio"/>' 
					<c:if test="${checkMenu == 1}"> class="text-danger"</c:if>
					<c:if test="${checkMenu != 1}"> class="text-light"</c:if>
					>BIO</a> | 
				<a href='<c:url value="/blog/list?page=1"/>' 
					<c:if test="${checkMenu == 2}"> class="text-danger"</c:if>
					<c:if test="${checkMenu != 2}"> class="text-light"</c:if>
				>BLOG</a> | 
				<a href='<c:url value="/contact"/>'
					<c:if test="${checkMenu == 3}"> class="text-danger"</c:if>
					<c:if test="${checkMenu != 3}"> class="text-light"</c:if>
				>CONTACT</a> | 
				<a href='<c:url value="/newart/list?page=1"/>' 
					<c:if test="${checkMenu == 4}"> class="text-danger"</c:if>
					<c:if test="${checkMenu != 4}"> class="text-light"</c:if>
				>NEW ART</a>
			</div>
			<div class="centerBlock" id="social-network">
				<!--youtube-->
				<a href="${linkDTO.youtube}" target="_blank"> <img
					src='<c:url value="/template/web/icon/youtube.png"/>'>
				</a>
				<!--instagram-->
				<a href="${linkDTO.youtube}" target="_blank"> <img
					src='<c:url value="/template/web/icon/insta.png"/>'>
				</a>
				<!--twitter-->
				<a href="${linkDTO.twitter}" target="_blank"> <img
					src='<c:url value="/template/web/icon/Twitter.png"/>'>
				</a>
				<!--facebook-->
				<a href="${linkDTO.facebook}" target="_blank"> <img
					src='<c:url value="/template/web/icon/fb.png"/>'>
				</a> <a href="${linkDTO.pinterest}" target="_blank"> <img
					src='<c:url value="/template/web/icon/prin.png"/>'>
				</a>
				<!--shop-->
				<a href="${linkDTO.shoppe}" target="_blank"> <img
					src='<c:url value="/template/web/icon/shoppe.png"/>'>
				</a> <a href="${linkDTO.etsy}" target="_blank"> <img
					src='<c:url value="/template/web/icon/etsy.png"/>'>
				</a>
			</div>

		</div>
		<div class="logo-center">
			<c:if test="${empty linkDTO.logo}">
				<img src='<c:url value="/template/web/icon/logo.png"/>'
					class="centerBlock" width="200px" height="200px">
			</c:if>
			<c:if test="${not empty linkDTO.logo}">
				<img src='<c:url value="/images/${linkDTO.logo}"/>'
					class="centerBlock" width="200px" height="200px">
			</c:if>
			
		</div>
		<div class="menu-right">
			<a href='<c:url value="/home?page=1"/>'
				<c:if test="${checkMenuCategoryDesign.equals('0')}"> class="text-danger"</c:if>
				<c:if test="${!checkMenuCategoryDesign.equals('0')}"> class="text-light"</c:if>
			>ALL</a>
			<c:forEach var="item" items="${photoCategory.listResult}">
					 | <a href='<c:url value="/home?code=${item.code}&page=1"/>'
					<c:if test="${checkMenuCategoryDesign.equals(item.code)}"> class="text-danger"</c:if>
					<c:if test="${!checkMenuCategoryDesign.equals(item.code)}"> class="text-light"</c:if>
					>${item.name}</a>
			</c:forEach>
		</div>
	</div>
</div>

<!-- .\header -->