<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Art</title>
</head>
<body>
<div class="row" style="margin-bottom: 10px;">
    <!-- Blog Entries Column -->
    <div class="col-md-12">
        <div class="card mb-4" style="padding: 10px;">
            <!-- Title -->
            <h1 class="mt-4">${newArtDTO.title}</h1>
            <hr>
            <!-- Date/Time -->
            <p>Posted on ${newArtDTO.createdDate}</p>
            <hr>
            <img src='<c:url value="/images/${newArtDTO.banner }"/>'
                 style="margin: 0px auto;width: 100%;">
            <hr>
            ${newArtDTO.content}
            <hr>
        </div>
    </div>
</div>
</body>
</html>