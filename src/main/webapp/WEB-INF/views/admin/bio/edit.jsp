<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/bio" />
<c:url var="BioURL" value="/admin/bio" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bio</title>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Edit bio</h1>
					
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">Bio</li>
						<li class="breadcrumb-item active">Edit</li>
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
						<label class="col-sm-3 control-label no-padding-right">Title</label>
						<div class="col-sm-12">
							<form:input path="title" cssClass="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Content</label>
						<div class="col-sm-12">
							<form:textarea path="content" cssClass="form-control" cols=""
								rows="5"></form:textarea>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Update Bio" id="btnUpdateBio" />
						</div>
					</div>
					<form:hidden path="id" id="id"/>
				</form:form>

			</div>
		</div>
	</section>
	
	
	

	<script>
	
	
		var editor = '';
		$(document).ready(function () {
			editor = CKEDITOR.replace('content');
			CKFinder.setupCKEditor(editor,'<c:url value="/template/ckfinder/"/>')
		});
		
		$('#btnUpdateBio').click(function(e) {
			e.preventDefault();
		    var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
			var id = $('#id').val();
			data["content"] = editor.getData();
			update(data);
		});
		function update(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${BioURL}";
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