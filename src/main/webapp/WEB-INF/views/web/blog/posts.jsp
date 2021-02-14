<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<div class="card mb-4" style="padding: 10px;">
				<!-- Title -->
				<h1 class="mt-4">${blogPosts.title}</h1>

				<!-- Author -->
				<p class="lead">
					by <a href="#">${blogPosts.createdBy}</a>
				</p>

				<hr>

				<!-- Date/Time -->
				<p>Posted on ${blogPosts.createdDate}</p>

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
					<a href="#" class="list-group-item">Category 1</a> <a href="#"
						class="list-group-item">Category 2</a> <a href="#"
						class="list-group-item">Category 3</a>
				</div>
			</div>

			<!-- Side Widget -->
			<div class="card my-4">
				<h5 class="card-header">Side Widget</h5>
				<div class="card-body">You can put anything you want inside of
					these side widgets. They are easy to use, and feature the new
					Bootstrap 4 card containers!</div>
			</div>

		</div>

	</div>
</body>
</html>