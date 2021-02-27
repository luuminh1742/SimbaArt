<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <!-- banner new art -->
    <ol class="carousel-indicators">
        <c:forEach var="item" items="${newArts.listResult}">
            <li data-target="#carouselExampleIndicators"
                data-slide-to="${item.id}"
                    <c:if test="${activeBanner == item.id}"> class="active"</c:if>></li>
        </c:forEach>
    </ol>
    <div class="carousel-inner">
        <c:forEach var="item" items="${newArts.listResult}">
            <a href='<c:url value="/newart/posts?code=${item.id}"/>'
                    <c:if test="${activeBanner == item.id}"> class="carousel-item active"</c:if>
                    <c:if test="${activeBanner != item.id}"> class="carousel-item"</c:if>>
                <img src='<c:url value="/images/${item.banner}"/>' alt="Banner"
                     class="d-block w-100 img-responsive center-block mx-auto img-banner-top">
            </a>
        </c:forEach>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- menu -->

<nav class="navbar navbar-dark navbar-expand-md justify-content-between">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target=".dual-nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div
                class="navbar-collapse collapse dual-nav w-50 order-1 order-md-0 flex-column">
            <ul class="navbar-nav">
                <li class="nav-item"><a href='<c:url value="/home?page=1"/>'
                        <c:if test="${checkMenu == 0}"> class="text-danger nav-link"</c:if>
                        <c:if test="${checkMenu != 0}"> class="text-light nav-link"</c:if>>HOME</a>
                </li>
                <li class="nav-item"><a href='<c:url value="/bio"/>'
                        <c:if test="${checkMenu == 1}"> class="text-danger nav-link"</c:if>
                        <c:if test="${checkMenu != 1}"> class="text-light nav-link"</c:if>>BIO</a>
                </li>
                <li class="nav-item"><a
                        href='<c:url value="/blog/list?page=1"/>'
                        <c:if test="${checkMenu == 2}"> class="text-danger nav-link"</c:if>
                        <c:if test="${checkMenu != 2}"> class="text-light nav-link"</c:if>>BLOG</a>
                </li>
                <li class="nav-item"><a href='<c:url value="/contact"/>'
                        <c:if test="${checkMenu == 3}"> class="text-danger nav-link"</c:if>
                        <c:if test="${checkMenu != 3}"> class="text-light nav-link"</c:if>>CONTACT</a>
                </li>
                <li class="nav-item"><a
                        href='<c:url value="/newart/list?page=1"/>'
                        <c:if test="${checkMenu == 4}"> class="text-danger nav-link"</c:if>
                        <c:if test="${checkMenu != 4}"> class="text-light nav-link"</c:if>>NEW
                    ART</a></li>

            </ul>
            <ul class="navbar-nav flex-row mb-2">
                <li class="nav-item">
                    <!--youtube-->
                    <a class="nav-link" href="${linkDTO.youtube}" target="_blank">
                        <img class="icon-social"
                             src='<c:url value="/template/web/icon/youtube.png"/>'>
                    </a>
                </li>
                <li class="nav-item">
                    <!--instagram-->
                    <a class="nav-link" href="${linkDTO.youtube}" target="_blank">
                        <img class="icon-social"
                             src='<c:url value="/template/web/icon/insta.png"/>'>
                    </a>
                </li>
                <li class="nav-item">
                    <!--twitter-->
                    <a class="nav-link" href="${linkDTO.twitter}" target="_blank">
                        <img class="icon-social"
                             src='<c:url value="/template/web/icon/Twitter.png"/>'>
                    </a>
                </li>
                <li class="nav-item">
                    <!--facebook-->
                    <a class="nav-link" href="${linkDTO.facebook}"
                       target="_blank"> <img class="icon-social"
                                             src='<c:url value="/template/web/icon/fb.png"/>'>
                    </a>
                </li>
                <li class="nav-item"><a class="nav-link"
                                        href="${linkDTO.pinterest}" target="_blank"> <img
                        class="icon-social"
                        src='<c:url value="/template/web/icon/prin.png"/>'>
                </a></li>
                <li class="nav-item">
                    <!--shop--> <a class="nav-link" href="${linkDTO.shoppe}"
                                   target="_blank"> <img class="icon-social"
                                                         src='<c:url value="/template/web/icon/shoppe.png"/>'>
                </a>
                </li>
                <li class="nav-item"><a class="nav-link" href="${linkDTO.etsy}"
                                        target="_blank"> <img class="icon-social"
                                                              src='<c:url value="/template/web/icon/etsy.png"/>'>
                </a></li>
            </ul>
        </div>
        <a href="#"
           class="navbar-brand mx-auto d-block text-center order-0 order-md-1 w-25 ">
            <c:if test="${empty linkDTO.logo}">
                <img class="img-responsive rounded mx-auto d-block rounded-circle"
                     src='<c:url value="/template/web/icon/logo.png"/>' alt="logo">
            </c:if> <c:if test="${not empty linkDTO.logo}">
            <img class="img-responsive rounded mx-auto d-block rounded-circle"
                 src='<c:url value="/images/${linkDTO.logo}"/>' alt="logo">
        </c:if>
        </a>
        <div class="navbar-collapse collapse dual-nav w-50 order-2 ">
            <ul
                    class="nav navbar-nav ml-auto list-inline d-flex justify-content-center"
                    style="padding: 0px 10px;">
                <li class="nav-item"><a href='<c:url value="/home?page=1"/>'
                        <c:if test="${checkMenuCategoryDesign.equals('0')}"> class="text-danger nav-link"</c:if>
                        <c:if test="${!checkMenuCategoryDesign.equals('0')}"> class="text-light nav-link"</c:if>>ALL</a>
                </li>
                <c:forEach var="item" items="${photoCategory.listResult}">
                    <li class="nav-item"><a
                            href='<c:url value="/home?code=${item.code}&page=1"/>'
                            <c:if test="${checkMenuCategoryDesign.equals(item.code)}"> class="text-danger nav-link"</c:if>
                            <c:if test="${!checkMenuCategoryDesign.equals(item.code)}"> class="text-light nav-link"</c:if>>${item.name}</a>
                    </li>
                </c:forEach>


            </ul>
        </div>
    </div>
</nav>


<!-- ./ menu -->

<!-- ./header -->