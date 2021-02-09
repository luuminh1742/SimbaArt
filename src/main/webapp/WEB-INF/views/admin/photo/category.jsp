<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/photo/category" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Photo Category</title>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Photo Category</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item ">Dashboard</li>
						<li class="breadcrumb-item active">Photo Category</li>
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
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#dialog1" title='Add New Category'
						onclick="clickAddPhotoCategory()">
						<i class="fa fa-plus-circle bigger-110 purple"></i> <span
							class="bigger-110">Add Category</span>
					</button>
				</div>

				<hr>


				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Category name</th>
							<th>Code</th>
							<th>Manipulation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model.listResult}">
							<tr>
								<td>${item.name}</td>
								<td>${item.code}</td>
								<td>
									<button type="button" class="btn btn-sm btn-primary btn-edit"
										data-toggle="modal" data-target="#dialog1"
										title='Update photo category'
										onclick="clickUpdatePhotoCategory(${item.id},'${item.name}')">
										<i class="fas fa-edit"></i>
									</button>
									<button type="button" class="btn btn-sm btn-primary btn-edit"
										title='Delete photo category'
										onclick="clickDeletePhotoCategory(${item.id})">
										<i class="fas fa-trash-alt"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>


	<div class="modal fade" id="dialog1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="title-modal">Add New Photo
						Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="formTestCategory">
						<textarea rows="5" class="form-control" id="name"
							placeholder="Enter category name ...."></textarea>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary" id="send">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>

		var id = -1;

		function clickDeletePhotoCategory(Id){
			event.preventDefault();
			let checkDelete = confirm("Confirm delete this category!");
			if (checkDelete == false) return;
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
					//alert("Xóa thành công");
				},
				error : function(error) {
					location.reload();
					//alert("Xóa thất bại");
				}
			});
		}
		function clickAddPhotoCategory(){
			$('#title-modal').text("Add New Photo Category");
			$('#name').text("");
			id = -1;
		}

		function clickUpdatePhotoCategory(Id,Name){
			$('#title-modal').text("Update Photo Category");
			$('#name').text(Name);
			id = Id;
		}

		$('#send').on('click', function(e) {
			e.preventDefault();
			var data = {};
			data["name"] = $('#name').val();

			if (data["name"].trim() === '') {
				alert("Bạn chưa nhập nội dung ");
				return;
			}

			if(id == -1){
				addPhotoCategory(data);
			}else{
				data["id"] = id;
				updatePhotoCategory(data);
			}
		});
		function addPhotoCategory(data){
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					location.reload();
					alert("Save successfully");
				},
				error : function(error) {

					alert("Save failed");
				}
			});
		}
		function updatePhotoCategory(data){
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					location.reload();
					alert("Save successfully");
				},
				error : function(error) {
					alert("Save failed");
				}
			});
		}
	</script>

</body>
</html>