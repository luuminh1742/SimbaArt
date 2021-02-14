<%@page import="com.simbaart.utils.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="font-weight-bold text-danger">Profile</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item">Account</li>
						<li class="breadcrumb-item active">Profile</li>
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
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">

						<!-- Profile Image -->
						<div class="card card-primary card-outline">
							<div class="card-body box-profile">
								<div class="text-center">
									<img class="profile-user-img img-fluid img-circle"
										src='<c:url value = "/template/admin/dist/img/user2-160x160.jpg"/>'
										alt="User profile picture">
								</div>

								<h3 class="profile-username text-center">
									<%=SecurityUtils.getPrincipal().getFullName()%>
								</h3>

								<a href='<c:url value="/exit"/>'
									class="btn btn-primary btn-block"><b>Log out</b></a>

							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->


					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-outline card-primary">
							<div class="card-header p-2">
								<ul class="nav nav-pills">
									<li class="nav-item"><a class="nav-link active"
										href="#inforuser" data-toggle="tab">Account information</a></li>
									<li class="nav-item"><a class="nav-link"
										href="#update-infor" data-toggle="tab">Update information</a></li>
									<li class="nav-item"><a class="nav-link"
										href="#change-password" data-toggle="tab">Password</a></li>
								</ul>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<div class="tab-content">
									<!-- Thông tin tài khoản -->
									<div class="active tab-pane" id="inforuser">


										<div class="card-body p-0">
											<table class="table table-sm table-hover table-striped">
												<tbody>
													<tr>
														<td>Username</td>
														<td>
															<%=SecurityUtils.getPrincipal().getUsername()%>
														</td>
													</tr>
													<tr>
														<td>Full name</td>
														<td>
															<%=SecurityUtils.getPrincipal().getFullName()%>
														</td>
													</tr>
													<tr>
														<td>Email</td>
														<td>
															
														</td>
													</tr>
												</tbody>
											</table>
										</div>



									</div>
									<!-- /.tab-pane -->

									<div class="tab-pane" id="update-infor">
										<form class="form-horizontal" id="formGeneralInfor">

											<h4 class="header blue bolder smaller">General</h4>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-username">Username</label>

												<div class="col-sm-12">
													<div class="input-group">
														<input class="form-control" type="text" name="username"
															placeholder="Username" value="${USERMODEL.username}" />
													</div>
												</div>
											</div>

											<div class="space-4"></div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-first">Full name</label>

												<div class="col-sm-12">
													<div class="input-group">
														<input class="form-control" type="text" name="fullName"
															placeholder="Full name" value="${USERMODEL.fullName}" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-4 control-label no-padding-right"
													for="form-field-date">Email</label>

												<div class="col-sm-12">
													<div class="input-group">
														<input class="form-control" type="text" name="fullName"
															placeholder="Email" value="${USERMODEL.fullName}" />
													</div>
												</div>
											</div>


											<div class="space-4"></div>


											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-primary" type="submit">
														<i class="ace-icon fa fa-check bigger-110"></i> Save
													</button>

													&nbsp; &nbsp;
													<button class="btn btn-primary" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i> Reset
													</button>
												</div>
											</div>
										</form>

									</div>
									<!-- /.tab-pane -->
									<!-- Cập nhật mật khẩu -->
									<div class="tab-pane" id="change-password">
										<form class="form-horizontal" id="formUpdatePassword">


											<div class="space-10"></div>

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-pass1">New password</label>

												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" type="password" id="password" />
													</div>
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right"
													for="form-field-pass2">Confirm password</label>

												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" type="password"
															id="confirmPassword" />
													</div>
												</div>
											</div>

											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-primary" type="submit">
														<i class="ace-icon fa fa-check bigger-110"></i> Update
													</button>

													&nbsp; &nbsp;
													<button class="btn btn-primary" type="reset">
														<i class="ace-icon fa fa-undo bigger-110"></i> Reset
													</button>
												</div>
											</div>
										</form>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
	</section>
</body>
</html>