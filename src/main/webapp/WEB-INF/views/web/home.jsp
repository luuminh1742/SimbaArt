<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

</head>
<body>


	<!-- Content -->

	<div class="content">

		<!-- Photo Grid -->
		<div class="row">
			<div class="column">
				<c:forEach var="item" items="${model1.listResult}">
					<div class="ctn">
						<a href='<c:url value="/images/${item.image}"/>'
							data-fancybox="gallery" data-caption="${item.description}">
							<img src='<c:url value="/images/${item.image}"/>'>
						</a>
						<div class="overlay">
	                        <span style="font-size: 10px;">${item.title}</span><br>
	                        <button onclick="showModal('${item.image}')" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"
	                        style="background-color:#fb5231 !important;">
	                            <i class="fa fa-share"></i>
	                        </button>
	                    </div>
					</div>
				</c:forEach>
			</div>
			<div class="column">
				<c:forEach var="item" items="${model2.listResult}">
					<div class="ctn">
						<a href='<c:url value="/images/${item.image}"/>'
							data-fancybox="gallery" data-caption="${item.description}">
							<img src='<c:url value="/images/${item.image}"/>'>
						</a>
						<div class="overlay">
	                        <span style="font-size: 10px;">${item.title}</span><br>
	                        <button style="background-color:#fb5231 !important;"
	                        onclick="showModal('${item.image}')" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	                            <i class="fa fa-share"></i>
	                        </button>
	                    </div>
					</div>
				</c:forEach>
			</div>
			<div class="column">
				<c:forEach var="item" items="${model3.listResult}">
					<div class="ctn">
						<a href='<c:url value="/images/${item.image}"/>'
							data-fancybox="gallery" data-caption="${item.description}">
							<img src='<c:url value="/images/${item.image}"/>'>
						</a>
						<div class="overlay">
	                        <span style="font-size: 10px;">${item.title}</span><br>
	                        <button style="background-color:#fb5231 !important;"
	                        onclick="showModal('${item.image}')" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	                            <i class="fa fa-share"></i>
	                        </button>
	                    </div>
					</div>
				</c:forEach>
			</div>
			<div class="column">
				<c:forEach var="item" items="${model4.listResult}">
					<div class="ctn">
						<a href='<c:url value="/images/${item.image}"/>'
							data-fancybox="gallery" data-caption="${item.description}">
							<img src='<c:url value="/images/${item.image}"/>'>
						</a>
						<div class="overlay">
	                        <span style="font-size: 10px;">${item.title}</span><br>
	                        <button style="background-color:#fb5231 !important;"
	                        onclick="showModal('${item.image}')" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	                            <i class="fa fa-share"></i>
	                        </button>
	                    </div>
					</div>
				</c:forEach>
			</div>
			<div class="column">
				<c:forEach var="item" items="${model5.listResult}">
					<div class="ctn">
						<a href='<c:url value="/images/${item.image}"/>'
							data-fancybox="gallery" data-caption="${item.description}">
							<img src='<c:url value="/images/${item.image}"/>'>
						</a>
						<div class="overlay">
	                        <span style="font-size: 10px;">${item.title}</span><br>
	                        <button style="background-color:#fb5231 !important;"
	                        onclick="showModal('${item.image}')" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	                            <i class="fa fa-share"></i>
	                        </button>
	                    </div>
					</div>
				</c:forEach>
			</div>
		</div>
		<form action="<c:url value='/home'/>" id="formSubmit" method="get"
			style="margin-top: 50px;">
			<ul class="pagination" id="pagination"
				style="margin: 0px auto !important; width: max-content;"></ul>
			<input type="hidden" value="" id="page" name="page" />
	
		</form>
		
		

	</div>
	
	<!-- .\Content -->
	<div class="container" style="padding: 10px 134px">
	
		<h4 class="text-light" style="margin-top: 20px;">Latest blog posts</h4>
		<div class="row" style="margin-top: 10px;">
			<c:forEach var="item" items="${blogPostsDto.listResult}">
				<a href='<c:url value="/blog/posts?code=${item.id}"/>'
				class="col-6 text-light title-blog" style="">
					<i class="fa fa-star" style="color:#fb5231"></i>
					${item.title}
					
				</a>
			</c:forEach>
		</div>
	</div>
	
	
	<!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Share</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="scroll-h">
                        <!-- Add font awesome icons -->
                        <a id="share-instagram" href="" target="_blank" class="fa fa-instagram social"></a>
                        <a id="share-fb" href="" target="_blank" class="fa fa-facebook social"></a>
                        <a id="share-twitter" href="" target="_blank" class="fa fa-twitter social"></a>
                        <a id="share-pinterest" href="#" target="_blank" class="fa fa-pinterest social"></a>
                        <a id="share-linkedin" href="" target="_blank" class="fa fa-linkedin social"></a>
                        <a id="share-reddit" href="#" target="_blank" class="fa fa-reddit social"></a>
                        <a id="share-tumblr" href="#" target="_blank" class="fa fa-tumblr social"></a>
                        <a id="share-snapchat" href="#" target="_blank" class="fa fa-snapchat-ghost social"></a>
                        <a id="share-skype" href="#" target="_blank" class="fa fa-skype social"></a>
                        <a id="share-dribbble" href="#" target="_blank" class="fa fa-dribbble social"></a>
                        <a id="share-vimeo" href="#" target="_blank" class="fa fa-vimeo social"></a>
                        <a id="share-vine" href="#" target="_blank" class="fa fa-vine social"></a>
                        <a id="share-foursquare" href="#" target="_blank" class="fa fa-foursquare social"></a>
                        <a id="share-stumbleupon" href="#" target="_blank" class="fa fa-stumbleupon social"></a>
                        <a id="share-flickr" href="#" target="_blank" class="fa fa-flickr social"></a>
                        <a id="share-rss" href="#" target="_blank" class="fa fa-rss social"></a>
                    </div>

                    <input id="show-link" type="text" value="this is link" style="width: 100%;
                    margin-top: 20px;">



                </div>

               

            </div>
        </div>
    </div>
	
	
	
	<script
		src='<c:url value="/template/web/vendor/lightbox/js/script.js"/>'></script>
	<script>
		function showModal(img){
			var url = window.location.hostname+'/images/'+img;
			
			//$("#myModal").modal();
			$("#show-link").val(url);
			$("#share-fb").attr("href", "http://www.facebook.com/share.php?u="+url);
			$("#share-twitter").attr("href", "https://twitter.com/share?url="+url);
			$("#share-linkedin").attr("href", "http://www.linkedin.com/shareArticle?mini=true&amp;url="+url);
			$("#share-instagram").attr("href", "https://instagram.com/share?url="+url);
			$("#share-pinterest").attr("href", "http://pinterest.com/pin/create/button/?url="+url);
			$("#share-reddit").attr("href", "https://www.reddit.com/submit?url="+url);
			$("#share-tumblr").attr("href", "http://www.tumblr.com/share/link?url="+url);
			$("#share-snapchat").attr("href", "https://www.reddit.com/submit?url="+url);
			
		}
		
		
	
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 5,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	</script>


</body>
</html>