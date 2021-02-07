<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- header -->
    <div>
      <div id="slide-banner" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="http://placehold.it/1024x320" alt="Los Angeles" class="centerBlock">
          </div>
          <div class="carousel-item">
            <img src="http://placehold.it/1024x320" alt="Chicago" class="centerBlock">
          </div>
          <div class="carousel-item">
            <img src="http://placehold.it/1024x320" alt="New York" class="centerBlock">
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#slide-banner" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#slide-banner" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
    </div>

    
    <!-- header end -->