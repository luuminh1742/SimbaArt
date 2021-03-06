<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="font-weight-bold text-danger">Gallery</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Dashboard</li>
                    <li class="breadcrumb-item active">Gallery</li>
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
            <div class="row">
                <c:forEach var="item" items="${listFileName}">
                    <div class="col-sm-2 align-self-center"
                         style="
							/* margin:5px 0px */;
							padding:3px;
							height:200px;">
                        <div style="
							border: 1px solid darkblue;
    						border-radius: 5px;
    						width:100%;
    						height:100%;
    						padding:5px; 
    						background-color: ghostwhite;
    						">
                            <a href='<c:url value="/images/${item}"/>'
                               data-toggle="lightbox" data-title="${item}"
                               data-gallery="gallery">
                                <img src='<c:url value="/images/${item}"/>'
                                     class="img-fluid mb-2" alt="white sample"
                                     style="max-height:180px;
								display: block;
								margin: 0px auto;"/>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
</body>
</html>