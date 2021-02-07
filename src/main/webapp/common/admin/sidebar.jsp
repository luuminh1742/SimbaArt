<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="" class="brand-link"> <img
		src='<c:url value="/template/admin/dist/img/AdminLTELogo.png"/>'
		alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
		style="opacity: .8"> <span class="brand-text font-weight-light">Simba Art</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img
					src='<c:url value="/template/admin/dist/img/user2-160x160.jpg"/>'
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href='<c:url value=""/>' class="d-block">Admin name<%-- ${USERMODEL.fullName} --%>
				</a>
			</div>
		</div>


		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item menu-open"><a
					href='<c:url value="/admin/home"/>' class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				
				<li class="nav-item"><a
					href='<c:url value="/admin/photo/category"/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Photo Category</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/photo/posts/list?page=1&limit=10"/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Photo Posts</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-book-open"></i>
						<p>Bio</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Blog Category</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Blog Posts</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Contact</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>New Art</p>
				</a></li>
				
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Banner</p>
				</a></li>
				
				
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>Image</p>
				</a></li>
				
				
				<li class="nav-item"><a
					href='<c:url value=""/>' class="nav-link">
						<i class="nav-icon fas fa-user-alt"></i>
						<p>Account</p>
				</a></li>


			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>