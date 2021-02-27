<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog</title>
</head>
<body>
<div class="row">

    <!-- Blog Entries Column -->
    <div class="col-md-8">

        <c:forEach var="item" items="${blogPostsDTO.listResult}">
            <!-- Blog Post -->


            <div class="card mb-4">
                <div class="blog-post">
                    <img class="card-img-top"
                         src='<c:url value="/images/${item.thumbnail}"/>'
                         alt="Card image cap">
                    <div class="card-body" style=" padding: 0px !important;">
                        <h3 class="card-title">
                            <a class="text-dark" href='<c:url value="/blog/posts?code=${item.id}"/>'>
                                    ${item.title}
                            </a>
                        </h3>
                        <p class="card-text">${item.shortDescription }</p>
                    </div>
                </div>

                <div class="card-footer text-muted">
                    Posted on ${item.createdDate} by <a href="#">${item.createdBy}</a>
                </div>
            </div>
        </c:forEach>


        <c:if test="${blogPostsDTO.listResult.size()  == 0}">
            <div class="card mb-4">
                <h2>
                    <center>No content</center>
                </h2>
            </div>
        </c:if>

        <!-- .\Content -->
        <form action="<c:url value='/blog/list'/>" id="formSubmit"
              method="get" style="margin: 50px 0px;">
            <ul class="pagination" id="pagination"
                style="margin: 0px auto !important; width: max-content;"></ul>
            <input type="hidden" value="" id="page" name="page"/>

        </form>
    </div>

    <!-- Sidebar Widgets Column -->
    <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4" style="margin-top: 0px !important;">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
                <div class="input-group">
                    <input type="text" class="form-control"
                           placeholder="Search for..."> <span
                        class="input-group-append">
							<button class="btn btn-secondary" type="button">Go!</button>
						</span>
                </div>
            </div>
        </div>


        <!-- Categories Widget -->
        <div class="card my-4">
            <h5 class="card-header">Categories</h5>
            <div class="list-group">
                <c:forEach var="item" items="${blogCategory.listResult}">
                    <a href='<c:url value="/blog/list?code=${item.code}&page=1"/>'
                       class="list-group-item">${item.name}</a>
                </c:forEach>

            </div>
        </div>


    </div>

</div>


<script>
    var totalPages = ${blogPostsDTO.totalPage};
    var currentPage = ${blogPostsDTO.page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
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