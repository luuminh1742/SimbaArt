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
<!-- Content -->

<!-- Page Features -->
<div class="row" style="margin-bottom: 10px;">

	<!-- bio -->
	<div class="col-lg-12 col-md-12 col-sm-12 mb-12">

		<div class="card col-lg-12 col-md-12 col-sm-12 mb-12">
			<h2 style="margin: 20px;">Bio</h2>
			<hr>
			<div class="bio-content">
				${model.content}
			</div>


		</div>


	</div>


</div>

<!-- Content end -->
</body>
</html>