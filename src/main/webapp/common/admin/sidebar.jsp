<%@page import="com.simbaart.utils.SecurityUtils"%>
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
				<a href='<c:url value="/admin/account/profile"/>' class="d-block">
				<%=SecurityUtils.getPrincipal().getFullName()%>
				</a>
			</div>
		</div>


		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item"><a
					href='<c:url value="/admin/home"/>'
					<c:if test="${checkSidebar == 0}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 0}"> class="nav-link" </c:if>> 
					<i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				
				<li class="nav-item"><a
					href='<c:url value="/admin/photo/category"/>'
					<c:if test="${checkSidebar == 1}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 1}"> class="nav-link" </c:if>>
						<i class="nav-icon fas fa-table"></i>
						<p>Photo Category</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/photo/posts/list?page=1"/>'
					<c:if test="${checkSidebar == 2}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 2}"> class="nav-link" </c:if>>
						<i class="nav-icon far fa-images"></i>
						<p>Photo Posts</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/blog/category"/>' 
					<c:if test="${checkSidebar == 3}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 3}"> class="nav-link" </c:if>>
						<i class="nav-icon fas fa-table"></i>
						<p>Blog Category</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/blog/posts/list?page=1"/>'
					<c:if test="${checkSidebar == 4}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 4}"> class="nav-link" </c:if>>
						<i class="nav-icon fas fa-newspaper"></i>
						<p>Blog Posts</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/contact?page=1"/>' 
					<c:if test="${checkSidebar == 5}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 5}"> class="nav-link" </c:if>>
						<i class="nav-icon far fa-envelope"></i>
						<p>Inbox</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/newart/list?page=1"/>' 
					<c:if test="${checkSidebar == 6}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 6}"> class="nav-link" </c:if>>
						<i class="nav-icon	far fa-newspaper"></i>
						<p>New Art</p>
				</a></li>
				<li class="nav-item"><a
					href='<c:url value="/admin/bio"/>' 
					<c:if test="${checkSidebar == 7}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 7}"> class="nav-link" </c:if>>
						<i class="nav-icon fas fa-biohazard"></i>
						<p>Bio</p>
				</a></li>
				
				
				<li class="nav-item"><a
					href='<c:url value=""/>' 
					<c:if test="${checkSidebar == 8}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 8}"> class="nav-link" </c:if>>
						<i class="nav-icon far fa-image"></i>
						<p>Gallery</p>
				</a></li>
				
				
				<li class="nav-item"><a
					href='<c:url value=""/>' 
					<c:if test="${checkSidebar == 9}"> class="nav-link active" </c:if>
					<c:if test="${checkSidebar != 9}"> class="nav-link" </c:if>>
						<i class="nav-icon fas fa-user-alt"></i>
						<p>
							Account
							<i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
		              <li class="nav-item">
		                <a href='<c:url value="/admin/account/profile"/>' class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>Profile</p>
		                </a>
		              </li>
		              <li class="nav-item">
		                <a href='<c:url value="/admin/account/link"/>' class="nav-link">
		                  <i class="far fa-circle nav-icon"></i>
		                  <p>Link</p>
		                </a>
		              </li>
		            </ul>
				
				</li>


			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>