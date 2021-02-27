<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog posts</title>
</head>
<body>
	<div class="row">

		<!-- Blog Entries Column -->
		<div class="col-md-8">

			<div class="card mb-4 posts-content">
				<!-- Title -->
				<h3 class="mt-4">${blogPosts.title}</h3>
				<hr>
				<!-- Date/Time -->
				<p>Posted on ${blogPosts.createdDate}</p>
				<!-- Author -->
				<p class="lead">
					by <a href="#">${blogPosts.createdBy}</a>
				</p>
				<hr>
				${blogPosts.content}
				<hr>
			</div>
		</div>

		<!-- Sidebar Widgets Column -->
		<div class="col-md-4">

			<!-- Search Widget -->
			<div class="card my-4" style="margin-top: 0px !important;">
				<h5 class="card-header">Search</h5>
				<div class="card-body">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-append">
							<button class="btn btn-secondary" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>

			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">Categories</h5>
				<div class="list-group">
					<c:forEach var="item" items="${blogCategory.listResult}">
						<a href='<c:url value="/blog/list?code=${item.code}&page=1"/>'
							class="list-group-item">${item.name}</a>
					</c:forEach>

				</div>
			</div>

		</div>

	</div>
</body>
</html>