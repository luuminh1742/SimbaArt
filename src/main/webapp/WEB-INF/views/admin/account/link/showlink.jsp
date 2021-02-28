<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Link</title>
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="font-weight-bold text-danger">Link</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Dashboard</li>
                    <li class="breadcrumb-item active">Link</li>
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
                       href='<c:url value="/admin/account/link/edit"/>'> <i
                            class="fas fa-edit bigger-110 purple"></i> <span
                            class="bigger-110">Create Link</span>
                    </a>
                </c:if>
                <c:if test="${not empty model.id}">
                    <a class="btn btn-primary" title='Update bio'
                       href='<c:url value="/admin/account/link/edit?id=${model.id}"/>'> <i
                            class="fas fa-edit bigger-110 purple"></i> <span
                            class="bigger-110">Update Link</span>
                    </a>
                </c:if>

            </div>
            <div class="card-body p-0">

                <table class="table table-sm table-hover table-striped">

                    <tr>
                        <td style="width: 200px;">Phone - <i class="fas fa-phone"></i>
                        </td>
                        <td>
                            ${model.phone}
                        </td>
                    </tr>
                    <tr>
                        <td>Youtube - <i class="fab fa-youtube"></i>
                        </td>
                        <td>
                            <a href="${model.youtube}">${model.youtube}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Facebook - <i class="fab fa-facebook"></i>
                        </td>
                        <td>
                            <a href="${model.facebook}">${model.facebook}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Twitter - <i class="fab fa-twitter"></i>
                        </td>
                        <td>
                            <a href="${model.twitter}">${model.twitter}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Instagram - <i class="fab fa-instagram"></i>
                        </td>
                        <td>
                            <a href="${model.instagram}">${model.instagram}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Pinterest - <i class="fab fa-pinterest"></i>
                        </td>
                        <td>
                            <a href="${model.pinterest}">${model.pinterest}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Shoppe - <i class="fas fa-shopping-bag"></i>
                        </td>
                        <td>
                            <a href="${model.shoppe}">${model.shoppe}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Etsy - <i class="fab fa-etsy"></i>
                        </td>
                        <td>
                            <a href="${model.etsy}">${model.etsy}</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Banner Below</td>
                        <td>
                            <img src='<c:url value="/images/${model.bannerBelow}"/>'
                                 style="width:465px;height:90px;"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Link Banner</td>
                        <td>
                            <a href="${model.linkBanner}">${model.linkBanner}</a>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</section>
</body>
</html>