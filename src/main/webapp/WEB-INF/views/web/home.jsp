<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

</head>
<body>
	<div class="centerBlock" style="padding: 5px;">
		<div class="row text-light menu-left">
			<div class="pull-right"
				style="width: 40%; padding-top: 64px; padding-bottom: 64px; padding-left: 15px; padding-right: 15px;">
				<div class="centerBlock menu-l-top">
					<a href="index.html" class="text-danger">HOME</a> | <a
						href="bio.html" class="text-light">BIO</a> | <a href="blog.html"
						class="text-light">BLOG</a> | <a href="contact.html"
						class="text-light">CONTACT</a> | <a href="#" class="text-light">NEW
						ART</a>
				</div>
				<div class="centerBlock" id="social-network">
					<!--youtube-->
					<a href="https://www.youtube.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/youtube.png"/>'>
					</a>
					<!--instagram-->
					<a href="https://www.instagram.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/insta.png"/>'>
					</a>
					<!--twitter-->
					<a href="https://www.twitter.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/Twitter.png"/>'>
					</a>
					<!--facebook-->
					<a href="https://www.facebook.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/fb.png"/>'>
					</a> <a href="https://www.pinterest.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/prin.png"/>'>
					</a>
					<!--shop-->
					<a href="https://shopee.vn/" target="_blank"> <img
						src='<c:url value="/template/web/icon/shoppe.png"/>'>
					</a> <a href="https://www.etsy.com/" target="_blank"> <img
						src='<c:url value="/template/web/icon/etsy.png"/>'>
					</a>
				</div>

			</div>
			<div class="logo-center">
				<img src='<c:url value="/template/web/icon/logo.png"/>'
					class="centerBlock">
			</div>
			<div class="menu-right">
				<a href='<c:url value="/home?page=1"/>' class="text-danger">ALL</a>
				<c:forEach var="item" items="${photoCategory.listResult}">
					 | <a href='<c:url value="/home/category?code=${item.code}&page=1"/>' 
					 class="text-light">${item.name}</a>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- .\header -->

	<!-- Content -->

	<div class="content">

		<div class="ct">
			
				<c:forEach var="item" items="${model.listResult}">
					<a data-fancybox="gallery"
						href='<c:url value="/images/${item.image}"/>'
						data-caption="${item.description}"> <img
						src='<c:url value="/images/${item.image}"/>' alt=""
						class="image">
					</a>
				</c:forEach>
				<br>
				
		</div>

	</div>

	<!-- .\Content -->
	<form action="<c:url value='/home'/>" id="formSubmit" method="get" style="margin-top:50px;">
		<ul class="pagination" id="pagination" 
			style="margin: 0px auto !important;
    				width: fit-content;"></ul>
		<input type="hidden" value="" id="page" name="page" /> 

	</form>
	<script
		src='<c:url value="/template/web/vendor/lightbox/js/script.js"/>'></script>
	<script>
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 5,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});

		$(function() {
			mosaicGrid('.content', 'img');
		});

		function mosaicGrid(selector, target) {
			var cols = [ 0, 0, 0, 0, 0 ];
			var allTarget = $(selector).find(target);
			if (0 === allTarget.length)
				return;
			allTarget.one('load', function(e) {
				var pos = minPos(cols);
				var x = pos * 100.5 / cols.length;
				var y = cols[pos];
				$(this).css({
					left : x + "%",
					top : y + "px",
					width : Math.floor(100 / cols.length) + "%"
				});
				cols[pos] = cols[pos] + $(this).height() + 1;
				$(selector).height(Math.max.apply(null, cols));
				$(this).off(e);
			}).each(function() {
				if (this.complete)
					$(this).trigger('load');
			});
		}
		function minPos(arr) {
			var min = Math.min.apply(null, arr);
			for (var i = 0; i < arr.length; i++) {
				if (min === arr[i])
					return i;
			}
		}
	</script>


</body>
</html>