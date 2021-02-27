<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Art</title>
</head>
<body>
<div class="row" style="margin-bottom: 10px;">

		<!-- Blog Entries Column -->
		<div class="col-md-12">
			
			<c:forEach var="item" items="${newArtDTO.listResult}">
				<!-- Blog Post -->


				<div class="card mb-4">
					<div class="blog-post">
						<img class="card-img-top"
							src='<c:url value="/images/${item.banner }"/>'
							alt="Card image cap">
						<div>
							<h2 class="card-title">${item.title}</h2>
							<p class="card-text">${item.shortDescription }</p>
							<a href='<c:url value="/newart/posts?code=${item.id}"/>' class="btn btn-primary" id="readMore">Read
								More &rarr;</a>
						</div>
					</div>

					<div class="card-footer text-muted">
						Posted on ${item.createdDate}
					</div>
				</div>
			</c:forEach>
		
			

			<!-- .\Content -->
			<form action="<c:url value='/newart/list'/>" id="formSubmit"
				method="get" style="margin-top: 50px;">
				<ul class="pagination" id="pagination"
					style="margin: 0px auto !important; width: max-content;"></ul>
				<input type="hidden" value="" id="page" name="page" />

			</form>
		</div>

		

	</div>
	<script>
		var totalPages = ${newArtDTO.totalPage};
		var currentPage = ${newArtDTO.page};
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
		
		
		
		
	</script>
</body>
</html>