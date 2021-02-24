<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/photo/editposts" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Photo Posts</title>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Photo Posts</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">Photo Posts</li>
						<li class="breadcrumb-item active">List</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- /.card-header -->
		<div class="card-body">
			<div class="card card-outline card-primary" style="padding: 20px;">
				<div class="pull-right">
					<a href='<c:url value="/admin/photo/posts/edit"/>'
						class="btn btn-primary"> <i
						class="fa fa-plus-circle bigger-110 purple"></i> <span
						class="bigger-110">Add Photo Posts</span>
					</a>

				</div>

				<hr>


				<form action="<c:url value='/admin/photo/posts/list'/>" id="formSubmit" method="get">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Title</th>
								<th>Image</th>
								<!-- <th>Image name</th> -->
								<th>Description</th>
								<th>Created date</th>
								<th>Manipulation</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
									<td>${item.title}</td>
									<td><img src='<c:url value="/images/${item.image}"/>'
										style="max-height:100px">
										</td>
									<%-- <td>${item.image}</td> --%>
									<td>${item.description}</td>
									<td>${item.createdDate}</td>
									<td><a
										href='<c:url value="/admin/photo/posts/edit?id=${item.id}"/>'
										title='Update photo posts'
										class="btn btn-sm btn-primary btn-edit"> <i
											class="fas fa-edit"></i>
									</a>
										<button type="button" class="btn btn-sm btn-primary btn-edit"
											title='Delete photo posts' onclick="clickDeletePhotoPosts(${item.id})">
											<i class="fas fa-trash-alt"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="pagination" id="pagination"></ul>
					<input type="hidden" value="" id="page" name="page"/>
				</form>
			</div>
		</div>
	</section>

	<script>
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 5,
	            startPage: currentPage,
	            onPageClick: function (event, page) {
	            	if (currentPage != page) {
	            		$('#page').val(page);
						$('#formSubmit').submit();
					}
	            }
	        });
	    });
	
	
	
		function clickDeletePhotoPosts(Id) {
			event.preventDefault();
			let checkDelete = confirm("Confirm delete this photo posts!");
			if (checkDelete == false)
				return;
			var data = {};
			data["id"] = Id;
			$.ajax({
				url : '${APIurl}',
				type : 'DELETE',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					location.reload();
					alert("Deleted successfully");
				},
				error : function(error) {
					location.reload();
					alert("Deletion failed");
				}
			});
		}
	</script>



</body>
</html>