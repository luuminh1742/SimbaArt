<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/newart" />
<c:url var="NewArtURL" value="/admin/newart/list?page=1" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${not empty model.id}">
	<title>Edit New Art</title>
</c:if>
<c:if test="${empty model.id}">
	<title>Add New Art</title>
</c:if>

</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
				<c:if test="${not empty model.id}">
					<h1 class="font-weight-bold text-danger">Edit New Art</h1>
				</c:if>
				<c:if test="${empty model.id}">
					<h1 class="font-weight-bold text-danger">Add New Art</h1>
				</c:if>
					
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">New Art</li>
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
						<label class="col-sm-3 control-label no-padding-right">Status</label>
						<div class="col-sm-9">
							<c:if test="${empty model.id}">
								<input type="checkbox" id="status"/>
								<label for="status" id="label-for-status">Hidden</label>
							</c:if>
							<c:if test="${not empty model.id}">
								<c:if test="${model.status == true}">
									<input type="checkbox" id="status" checked/>
									<label for="status" id="label-for-status">Show</label>
								</c:if>
								<c:if test="${model.status == false}">
									<input type="checkbox" id="status"/>
									<label for="status" id="label-for-status">Hidden</label>
								</c:if>
								
							</c:if>
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
						<label class="col-sm-3 control-label no-padding-right">Banner (Recommend 1024x320)</label>
						<div class="col-sm-9">
							<input type="button" id="btn" value="Browse Server" onclick="BrowseServer()">&nbsp;
							<input type="file" id="image" name="image" style="max-width: inherit;"
							accept="image/png, image/jpeg, image/jpg, image/gif"  onchange="readURL(this);"/>
						</div>
					</div>
					<c:if test="${not empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src='<c:url value="/images/${model.banner}"/>' alt="your image" 
							style="border: 0.1px solid black;" width="256px" height="80px">
						</div>
					</c:if>
					<c:if test="${empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src="http://placehold.it/1024x320" alt="your image" 
							style="border: 0.1px solid black;" width="256px" height="80px"/>
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
									value="Update New Art" id="btnAddOrUpdateNewArt" />
							</c:if>
							<c:if test="${empty model.id}">
								<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Add New Art" id="btnAddOrUpdateNewArt" />
							</c:if>
						</div>
					</div>
					
					<form:hidden path="id" id="id"/>
					<form:hidden path="banner" id="img" />
				</form:form>

			</div>
		</div>
	</section>
	
	
	
	
	
	
	
	
	

	<script>
	
	
	
	$('#status').change(function () {
	    if($('#status')[0].checked)
	    	$('#label-for-status').text('Show');
	    else
	    	$('#label-for-status').text('Hidden');
	 });
	
	
	var editor = '';
	$(document).ready(function () {
		editor = CKEDITOR.replace('content',{
			'filebrowserBrowseUrl': '/ckfinder/ckfinder.html',
		    'filebrowserImageBrowseUrl': '/ckfinder/ckfinder.html?Type=Images',
		    'filebrowserImageUploadUrl':  '/ckfinder/core/connector/java/connector.java '});
		CKFinder.setupCKEditor(editor,'/ckfinder/');
	});
	
	function BrowseServer(){
		var finder = new CKFinder();
		finder.basePath="../";
		finder.selectActionFunction = SetFileField;
		finder.popup();
	}
	function SetFileField(fileUrl){
		var filename = fileUrl.split('/').pop().split('?')[0].split('#')[0];
		$('#img').val(filename);
		$('#blah').attr('src', fileUrl);
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
	
		$('#btnAddOrUpdateNewArt').click(function(e) {
			e.preventDefault();
		    var data = {};
		    var formData = $('#formSubmit').serializeArray();
		    $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    data["content"] = editor.getData();
		    data["status"] = $('#status')[0].checked;
			var id = $('#id').val();
			var file = $('#image')[0].files[0];
			if (file != undefined) {
				var reader = new FileReader();
				reader.onload = function(e) {
					data["base64"] = e.target.result;
					data["banner"] = file.name;
					if (id == "") {
						addNewArt(data);
					} else {
						updateNewArt(data);
					}
				};
				reader.readAsDataURL(file);
			} else {
				if (id == "") {
					data["base64"] = '';
					data["banner"] = $('#img').val();
					addNewArt(data);
				} else {
					data["base64"] = '';
					data["banner"] = $('#img').val();
					updateNewArt(data);
				}
			}
		});
		function addNewArt(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${NewArtURL}";
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
		function updateNewArt(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${NewArtURL}";
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