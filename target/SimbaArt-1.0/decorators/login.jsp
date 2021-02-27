<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Login"/></title>

    <link rel="icon" type="image/png" href='<c:url value="/template/web/icon/logo.ico"/>'/>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link href='<c:url value="/template/web/vendor/bootstrap/css/bootstrap.min.css"/>'
          rel="stylesheet">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/template/login/vendor/animate/animate.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href='<c:url value="/template/login/vendor/css-hamburgers/hamburgers.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/template/login/vendor/select2/select2.min.css"/>'>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href='<c:url value="/template/login/css/util.css"/>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/template/login/css/main.css"/>'>
    <!--===============================================================================================-->
</head>
<body>

<dec:body/>

<!--===============================================================================================-->
<script src="<c:url value='/template/web/vendor/jquery/jquery.min.js' />"></script>
<!--===============================================================================================-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!--===============================================================================================-->
<script src='<c:url value="/template/login/vendor/select2/select2.min.js"/>'></script>
<!--===============================================================================================-->
<script src='<c:url value="/template/login/vendor/tilt/tilt.jquery.min.js"/>'></script>
<script>
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src='<c:url value="/template/login/js/main.js"/>'></script>
</body>
</html>