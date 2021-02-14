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