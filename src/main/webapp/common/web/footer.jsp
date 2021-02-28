<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!-- banner -->
<div class="banner-under">
    <a href="${linkDTO.linkBanner}" target="_blank">
        <img src='<c:url value="/images/${linkDTO.bannerBelow}"/>' alt="Los Angeles"
             class="d-block w-100 img-responsive center-block mx-auto banner-bottom">
    </a>

</div>
<!-- Footer -->
<footer class="py-5">
    <div class="container">
        <p class="m-0 text-center text-white">&copy; 2021 Simba Art - ILLustration &copy;</p>
        <p class="m-0 text-center text-white">

            Mobile : ${linkDTO.phone} <img src='<c:url value="/template/web/icon/zalo_35px.png"/>' width="25px">

        </p>
    </div>
    <!-- /.container -->
</footer>