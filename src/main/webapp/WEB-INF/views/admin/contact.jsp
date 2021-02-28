<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api/contact"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inbox</title>
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="font-weight-bold text-danger">Inbox</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Dashboard</li>
                    <li class="breadcrumb-item active">Inbox</li>
                </ol>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
    <!-- /.card-header -->
    <div class="card-body">
        <div class="card card-outline card-primary" style="padding: 20px;">
            <div class="pull-right">
                <button id="btnDelete" type="button" class="btn btn-primary"
                        title='Delete message'>
                    <i class="fas fa-trash-alt bigger-110 purple"></i>
                    <span class="bigger-110">Delete message</span>
                </button>
            </div>
            <hr>

            <form action="<c:url value='/admin/contact'/>" id="formSubmit" method="get">

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Created Date</th>
                        <th>Manipulation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${model.listResult}">
                        <tr>
                            <td><input type="checkbox" id="checkbox_${item.id}"
                                       value="${item.id}" class="checkAllItem"></td>
                            <td>${item.name}</td>
                            <td>
                                <address>
                                    <a href="mailto:${item.email}">${item.email}</a>
                                </address>
                            </td>
                            <td>${item.createdDate}</td>
                            <td>
                                <button type="button" data-toggle="modal" data-target="#dialogShowMessage"
                                        onclick="clickShowMessage('${item.name}','${item.message}')"
                                        class="btn btn-primary">
                                    <i class="fas fa-eye bigger-110 purple"></i>
                                    <span class="bigger-110">Details</span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <ul class="pagination" id="pagination"></ul>
                <input type="hidden" value="" id="page" name="page"/>
            </form>
        </div>
    </div>
</section>
<div class="modal fade" id="dialogShowMessage" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header bg-light text-black">
                <h5 class="modal-title" id="title-modal">Name</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <textarea rows="5" class="form-control" id="message" readonly></textarea>
            </div>
        </div>
    </div>
</div>
<script>
    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
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

    function clickShowMessage(name, mesage) {
        $('#title-modal').text(name);
        $('#message').text(mesage);
    }

    $(document).ready(function () {
        $('#checkAll').change(function () {
            var checkItem = $('.checkAllItem');
            if ($(this).prop("checked") == true) {
                for (var i = 0; i < checkItem.length; i++) {
                    checkItem[i].checked = true;
                }
            } else if ($(this).prop("checked") == false) {
                for (var i = 0; i < checkItem.length; i++) {
                    checkItem[i].checked = false;
                }
            }
        });
    })
    $("#btnDelete").click(function () {
        var data = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids;
        if (ids.length === 0) {
            alert('You have not selected the message you want to delete!');
            return;
        }
        var confirmDelete = confirm("Confirm delete this message");
        if (confirmDelete) {
            deleteMessage(data);
        }
    });

    function deleteMessage(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                location.reload();
                alert("Deleted successfully");
            },
            error: function (error) {
                location.reload();
                alert("Deletion failed");
            }
        });
    }
</script>
</body>
</html>