<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/blog/posts" />
<c:url var="BlogPostsURL" value="/admin/blog/posts/list?page=1" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${not empty model.id}">
	<title>Edit blog posts</title>
</c:if>
<c:if test="${empty model.id}">
	<title>Add blog posts</title>
</c:if>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
				<c:if test="${not empty model.id}">
					<h1 class="font-weight-bold text-danger">Edit blog posts</h1>
				</c:if>
				<c:if test="${empty model.id}">
					<h1 class="font-weight-bold text-danger">Add blog posts</h1>
				</c:if>
					
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">Blog Posts</li>
						<c:if test="${not empty model.id}">
							<li class="breadcrumb-item active">Edit</li>
						</c:if>
						<c:if test="${empty model.id}">
							<li class="breadcrumb-item active">Add</li>
						</c:if>
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

				<form:form class="form-horizontal" role="form" id="formSubmit"
					modelAttribute="model">
					<div class="form-group">
						<label for="testCategoryId"
							class="col-sm-3 control-label no-padding-right">Blog
							category:</label>
						<div class="col-sm-9">
							<select id="blogCategoryId" class="form-control">

								<c:if test="${empty model.blogCategoryId}">
									<option value="" label="-- Blog category --" />
									<c:forEach var="item" items="${blogCategories}">
										<option value="${item.id}">${item.name}</option>
									</c:forEach>
								</c:if>
								<c:if test="${not empty model.blogCategoryId}">
									<option value="" label="-- Blog category --" />
									<c:forEach var="item" items="${blogCategories}">
										<option value="${item.id}"
											<c:if test="${item.id == model.blogCategoryId}">selected="selected"</c:if>>
											${item.name}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Title</label>
						<div class="col-sm-9">
							<form:input path="title" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Short Description</label>
						<div class="col-sm-9">
							<form:textarea path="shortDescription" cssClass="form-control" cols=""
								rows="5"></form:textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Thumbail</label>
						<div class="col-sm-9">
							<button type="button" data-toggle="modal"data-target="#dialog1">
							Select my image</button>&nbsp;
							<input type="file" id="image" name="image" style="max-width: inherit;"
							accept="image/png, image/jpeg, image/jpg"  onchange="readURL(this);"/>
						</div>
					</div>
					<c:if test="${not empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src='<c:url value="/images/${model.thumbnail}"/>' alt="your image" 
							style="border: 0.1px solid black;" width="220px" height="132px">
						</div>
					</c:if>
					<c:if test="${empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src="http://placehold.it/220x132" alt="your image" 
							style="border: 0.1px solid black;" width="220px" height="132px"/>
						</div>
					</c:if>
					
					<br>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Content</label>
						<div class="col-sm-12">
							<form:textarea path="content" cssClass="form-control" cols=""
								rows="5"></form:textarea>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<div class="col-sm-12">
							<c:if test="${not empty model.id}">
								<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Update Blog Posts" id="btnAddOrUpdateBlogPosts" />
							</c:if>
							<c:if test="${empty model.id}">
								<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Add Blog Posts" id="btnAddOrUpdateBlogPosts" />
							</c:if>
						</div>
					</div>
					
					<form:hidden path="id" id="id"/>
					<form:hidden path="thumbnail" id="img" />
				</form:form>

			</div>
		</div>
	</section>
	
	
	
	
	<div class="modal fade" id="dialog1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" style="width: 900px;">
			<div class="modal-content" style="width: 900px;">

				<div class="modal-header bg-light text-dark">
					<h5 class="modal-title" id="title-modal">List Image</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" style="width: 900px;">
					<form id="formTestCategory">
						<div>
							<c:forEach var="image" items="${listFileName}">
								<button type="button" title='${image}'
								onclick="clickChooseImage('${image}')"
								data-dismiss="modal">
									<img src='<c:url value="/images/${image}"/>'
										width="110px" height="100px">
								</button>
									
									
							</c:forEach>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning"
								data-dismiss="modal">Cancel</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	

	<script>
	var editor = '';
	$(document).ready(function () {
		editor = CKEDITOR.replace('content');
		CKFinder.setupCKEditor(editor,'<c:url value="/template/ckfinder/"/>')
	});
	
	function clickChooseImage(img){
		$('#img').val(img);
		$('#blah').attr('src', '<c:url value="/images/'+img+'"/>');
	}
	
	
	function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader();
	           reader.onload = function (e) {
	               $('#blah').attr('src', e.target.result);
	           };
	           reader.readAsDataURL(input.files[0]);
	       }
	 }
	
	
	
	
		$('#btnAddOrUpdateBlogPosts').click(function(e) {
			e.preventDefault();
		    var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    data["content"] = editor.getData();
		    data["blogCategoryId"] = $('#blogCategoryId').val();
			var id = $('#id').val();
			var file = $('#image')[0].files[0];
			if (file != undefined) {
				var reader = new FileReader();
				reader.onload = function(e) {
					data["base64"] = e.target.result;
					data["thumbnail"] = file.name;
					if (id == "") {
						addBlogPosts(data);
					} else {
						updateBlogPosts(data);
					}
				};
				reader.readAsDataURL(file);
			} else {
				if (id == "") {
					data["base64"] = '';
					data["thumbnail"] = $('#img').val();
					addBlogPosts(data);
				} else {
					data["base64"] = '';
					data["thumbnail"] = $('#img').val();
					updateBlogPosts(data);
				}
			}
		});
		function addBlogPosts(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${BlogPostsURL}";
					alert("Add successfully");
					//console.log(result);
				},
				error : function(error) {
					//window.location.href = "${NewURL}";
					alert("Add failed");
					//console.log(error);
				}
			});
		}
		function updateBlogPosts(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${BlogPostsURL}";
					alert("Update successfully");
					//console.log(result);
				},
				error : function(error) {
					//window.location.href = "${NewURL}";
					alert("Update failed");
					//console.log(error);
				}
			});
		}
	</script>

</body>
</html>