<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
    <!-- banner  -->
    <div class="banner-under">
		<a href="${linkDTO.linkBanner}" target="_blank">
			<img src='<c:url value="/images/${linkDTO.bannerBelow}"/>' alt="Los Angeles" class="centerBlock"
      		style="width:930px;height:180px;">
		</a>
      
    </div>
    <!-- Footer -->
    <footer class="py-5">
      <div class="container">
        <p class="m-0 text-center text-white">&copy; 2021 Simba Art - ILLustration &copy;</p>
        <p class="m-0 text-center text-white">Mobile : ${linkDTO.phone}</p>
      </div>
      <!-- /.container -->
    </footer>