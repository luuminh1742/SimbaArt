<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bio</title>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Bio</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active">Bio</li>
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
				<div class="card-header">
					<c:if test="${empty model.id}">
						<a class="btn btn-primary" title='Update bio'
							href='<c:url value="/admin/bio/edit"/>'> <i
							class="fas fa-edit bigger-110 purple"></i> <span
							class="bigger-110">Create bio</span>
						</a>
					</c:if>
					<c:if test="${not empty model.id}">
						<a class="btn btn-primary" title='Update bio'
							href='<c:url value="/admin/bio/edit?id=${model.id}"/>'> <i
							class="fas fa-edit bigger-110 purple"></i> <span
							class="bigger-110">Update bio</span>
						</a>
					</c:if>

				</div>
				<div class="card-body p-0">
					<h2><u>Content</u></h2>
					<c:if test="${empty model.id}">
						<h3 style="text-align: center;">No content</h3>
					</c:if>
					<c:if test="${not empty model.id}">
						${model.content}
					</c:if>

				</div>
			</div>
		</div>
	</section>
</body>
</html>