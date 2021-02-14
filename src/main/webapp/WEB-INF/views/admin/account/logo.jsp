<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/link/logo" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logo</title>
</head>
<body>
<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Logo</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active">Logo</li>
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
						<label class="col-sm-3 control-label no-padding-right">Logo</label>
						<div class="col-sm-9">
							<button type="button" data-toggle="modal"data-target="#dialog1">
							Select my image</button>&nbsp;
							<input type="file" id="image" name="image" style="max-width: inherit;"
							accept="image/png, image/jpeg, image/jpg"  onchange="readURL(this);"/>
						</div>
					</div>
					<c:if test="${not empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src='<c:url value="/images/${model.logo}"/>' alt="your image" 
							style="border: 0.1px solid black;" width="200px" height="200px">
						</div>
					</c:if>
					<c:if test="${empty model.id}">
						<div class="form-group col-sm-12">
							<img id="blah" src='<c:url value="/template/web/icon/logo.png"/>' alt="your image" 
							style="border: 0.1px solid black;" width="200px" height="200px"/>
						</div>
					</c:if>
					
					<br>
					<div class="form-group">
						<div class="col-sm-12">
							<c:if test="${not empty model.id}">
								<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Update Logo" id="btnAddOrUpdate" />
							</c:if>
							<c:if test="${empty model.id}">
								<input type="button" class="btn btn-white btn-primary btn-bold"
									value="Add Logo" id="btnAddOrUpdate" />
							</c:if>
						</div>
					</div>
					<form:hidden path="id" id="id"/>
					<form:hidden path="logo" id="img" />
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
	
	$('#btnAddOrUpdate').click(function(e) {
		e.preventDefault();
	    var data = {};
		var id = $('#id').val();
		data["id"] = id;
		var file = $('#image')[0].files[0];
		if (file != undefined) {
			var reader = new FileReader();
			reader.onload = function(e) {
				data["base64"] = e.target.result;
				data["logo"] = file.name;
				if (id == "") {
					add(data);
				} else {
					update(data);
				}
			};
			reader.readAsDataURL(file);
		} else {
			if (id == "") {
				data["base64"] = '';
				data["logo"] = $('#img').val();
				add(data);
			} else {
				data["base64"] = '';
				data["logo"] = $('#img').val();
				update(data);
			}
		}
	});
	function add(data) {
		$.ajax({
			url : '${APIurl}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				location.reload();
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
	function update(data) {
		$.ajax({
			url : '${APIurl}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				location.reload();
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