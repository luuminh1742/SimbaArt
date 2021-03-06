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
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/fontawesome-free/css/all.min.css"/>'>
    <!-- Ionicons -->
    <link rel="stylesheet"
          href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>'>
    <!-- iCheck -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>'>
    <!-- JQVMap -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/jqvmap/jqvmap.min.css"/>'>
    <!-- Theme style -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/dist/css/adminlte.min.css"/>'>
    <!-- overlayScrollbars -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>'>
    <!-- Daterange picker -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/daterangepicker/daterangepicker.css"/>'>
    <!-- summernote -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/summernote/summernote-bs4.min.css"/>'>
    <!-- Ekko Lightbox -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/plugins/ekko-lightbox/ekko-lightbox.css"/>'>
    <!-- Theme style -->
    <link rel="stylesheet"
          href='<c:url value="/template/admin/css/style.css"/>'>
    <script src='<c:url value="/template/admin/ajax/jquery.min.js"/>'></script>
    <!-- ckeditor -->
    <script src='<c:url value="/ckeditor/ckeditor.js" />'></script>
    <!-- ckfinder -->
    <script src='<c:url value="/ckfinder/ckfinder.js"/>'></script>
    <!--  phân trang  -->
    <script
            src='<c:url value="/template/admin/plugins/jquery/jquery.min.js"/>'></script>
    <script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>

</head>

<body class="hold-transition sidebar-mini layout-fixed">

<div class="wrapper">
    <!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->

    <!-- sidebar -->
    <%@ include file="/common/admin/sidebar.jsp" %>
    <!-- sidebar -->

    <!-- Content -->
    <div class="content-wrapper">
        <dec:body/>
    </div>

    <!-- Content -->
    <!-- footer -->
    <%@ include file="/common/admin/footer.jsp" %>
    <!-- footer -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->

</div>

<!-- jQuery -->

<!-- jQuery UI 1.11.4 -->
<script
        src='<c:url value="/template/admin/plugins/jquery-ui/jquery-ui.min.js"/>'></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->

<!-- Sparkline -->
<script
        src='<c:url value="/template/admin/plugins/sparklines/sparkline.js"/>'></script>
<!-- JQVMap -->
<script
        src='<c:url value="/template/admin/plugins/jqvmap/jquery.vmap.min.js"/>'></script>
<script
        src='<c:url value="/template/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"/>'></script>
<!-- jQuery Knob Chart -->
<script
        src='<c:url value="/template/admin/plugins/jquery-knob/jquery.knob.min.js"/>'></script>
<!-- daterangepicker -->
<script
        src='<c:url value="/template/admin/plugins/moment/moment.min.js"/>'></script>
<script
        src='<c:url value="/template/admin/plugins/daterangepicker/daterangepicker.js"/>'></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
        src='<c:url value="/template/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"/>'></script>
<!-- Summernote -->
<script
        src='<c:url value="/template/admin/plugins/summernote/summernote-bs4.min.js"/>'></script>
<!-- overlayScrollbars -->
<script
        src='<c:url value="/template/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"/>'></script>
<!-- AdminLTE App -->
<script src='<c:url value="/template/admin/dist/js/adminlte.js"/>'></script>
<!-- Ekko Lightbox -->
<script
        src='<c:url value="/template/admin/plugins/ekko-lightbox/ekko-lightbox.min.js"/>'></script>

</body>
</html>