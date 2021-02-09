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
					<a class="btn btn-primary" title='Update bio'
					href='<c:url value="/admin/bio/edit?id=${model.id}"/>'>
						<i class="fas fa-edit bigger-110 purple"></i> <span
							class="bigger-110">Update bio</span>
					</a>
				</div>
				<div class="card-body p-0">
					<table class="table table-striped table-bordered table-hover">
						<tbody>
							<tr>
								<td style="width: 200px;">Title</td>
								<td>${model.title}</td>
							</tr>
							<tr>
								<td>Created Date</td>
								<td>${model.createdDate}</td>
							</tr>
							<tr>
								<td>Last Modified Date</td>
								<td>${model.modifiedDate}</td>
							</tr>
							<tr>
								<td>Content</td>
								<td>${model.content}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</body>
</html>