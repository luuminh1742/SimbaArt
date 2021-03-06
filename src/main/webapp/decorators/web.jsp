<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><dec:title default="Home"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href='<c:url value="/template/web/icon/logo.ico"/>'/>
    <link href='<c:url value="/template/web/vendor/bootstrap/css/bootstrap.min.css"/>'
            rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css"/>

    <link href='<c:url value="/template/web/css/style-home.css"/>'
          rel="stylesheet">
    <link href='<c:url value="/template/web/css/style-social.css"/>'
          rel="stylesheet">
     <link href='<c:url value="/template/web/css/style-bio.css"/>'
        rel="stylesheet">
    <link href='<c:url value="/template/web/css/style-blog.css"/>'
          rel="stylesheet">
    <link href='<c:url value="/template/web/css/style-newart.css"/>'
          rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/template/web/vendor/lightbox/css/style.css"/>'>
    <!--  phân trang  -->
    <script src="<c:url value='/template/web/vendor/jquery/jquery.min.js' />"></script>
    <script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>

    <style>
        body {
            background-image: url('<c:url value="/template/web/img/background-main.jpg"/>');
        }
    </style>
</head>

<body>
<div class="container">
    <%@include file="/common/web/header.jsp" %>



     <dec:body />

     <%@include file="/common/web/footer.jsp"%>
</div>


<%-- <script
    src='<c:url value="/template/web/vendor/lightbox/js/jquery-3.3.1.min.js"/>'></script> --%>
<%-- <script
    src='<c:url value="/template/web/vendor/lightbox/lib/bootstrap/js/bootstrap.min.js"/>'></script> --%>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script>
    $('.carousel').carousel({
        interval: 5000
    })
</script>

</body>
</html>