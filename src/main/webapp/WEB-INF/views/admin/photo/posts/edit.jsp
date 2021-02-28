<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api/photo/editposts"/>
<c:url var="PhotoPostsURL" value="/admin/photo/posts/list?page=1"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <c:if test="${not empty model.id}">
        <title>Edit photo posts</title>
    </c:if>
    <c:if test="${empty model.id}">
        <title>Add photo posts</title>
    </c:if>

</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <c:if test="${not empty model.id}">
                    <h1 class="font-weight-bold text-danger">Edit photo posts</h1>
                </c:if>
                <c:if test="${empty model.id}">
                    <h1 class="font-weight-bold text-danger">Add photo posts</h1>
                </c:if>

            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Dashboard</li>
                    <li class="breadcrumb-item">Photo Posts</li>
                    <c:if test="${not empty model.id}">
                        <li class="breadcrumb-item active">Edit</li>
                    </c:if>
                    <c:if test="${empty model.id}">
                        <li class="breadcrumb-item active">Add</li>
                    </c:if>
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

            <form:form class="form-horizontal" role="form" id="formSubmit"
                       modelAttribute="model">
                <div class="form-group">
                    <label for="testCategoryId"
                           class="col-sm-3 control-label no-padding-right">Photo
                        category:</label>
                    <div class="col-sm-9">
                        <select id="photoCategoryId" class="form-control">

                            <c:if test="${empty model.photoCategoryId}">
                                <option value="" label="-- Photo category --"/>
                                <c:forEach var="item" items="${photoCategories}">
                                    <option value="${item.id}">${item.name}</option>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty model.photoCategoryId}">
                                <option value="" label="-- Photo category --"/>
                                <c:forEach var="item" items="${photoCategories}">
                                    <option value="${item.id}"
                                            <c:if test="${item.id == model.photoCategoryId}">selected="selected"</c:if>>
                                            ${item.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Title</label>
                    <div class="col-sm-9">
                        <form:input path="title" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Description</label>
                    <div class="col-sm-9">
                        <form:textarea path="description" cssClass="form-control" cols="" rows="5"></form:textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Image</label>
                    <div class="col-sm-9">
                        <input type="button" id="btn" value="Browse Server" onclick="BrowseServer()">
                    </div>
                    <br>
                    <div class="col-sm-9">
                        <input type="file" id="image" name="image" style="max-width: inherit;"
                               accept="image/png, image/jpeg, image/jpg, image/gif" onchange="readURL(this);"/>
                    </div>
                </div>
                <c:if test="${not empty model.id}">
                    <div class="form-group col-sm-12">
                        <img id="blah" src='<c:url value="/images/${model.image}"/>' alt="your image"
                             style="max-width: inherit;border: 0.1px solid black;">
                    </div>
                </c:if>
                <c:if test="${empty model.id}">
                    <div class="form-group col-sm-12">
                        <img id="blah" src="http://placehold.it/180" alt="your image"
                             style="max-width: inherit;border: 0.1px solid black;"/>
                    </div>
                </c:if>

                <br>
                <div class="form-group">
                    <div class="col-sm-12">
                        <c:if test="${not empty model.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold"
                                   value="Update Photo Posts" id="btnAddOrUpdatePhotoPosts"/>
                        </c:if>
                        <c:if test="${empty model.id}">
                            <input type="button" class="btn btn-white btn-primary btn-bold"
                                   value="Add Photo Posts" id="btnAddOrUpdatePhotoPosts"/>
                        </c:if>
                    </div>
                </div>
                <form:hidden path="id" id="id"/>
                <form:hidden path="image" id="img"/>
            </form:form>

        </div>
    </div>
</section>


<script>

    var editor = '';
    $(document).ready(function () {
        editor = CKEDITOR.replace('description');
    });


    function BrowseServer() {
        var finder = new CKFinder();
        finder.basePath = "../";
        finder.selectActionFunction = SetFileField;
        finder.popup();
    }

    function SetFileField(fileUrl) {
        var filename = fileUrl.split('/').pop().split('?')[0].split('#')[0];
        $('#img').val(filename);
        $('#blah').attr('src', fileUrl);
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    $('#btnAddOrUpdatePhotoPosts').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        data["description"] = editor.getData();
        data["photoCategoryId"] = $('#photoCategoryId').val();
        var id = $('#id').val();
        var file = $('#image')[0].files[0];
        if (file != undefined) {
            var reader = new FileReader();
            reader.onload = function (e) {
                data["base64"] = e.target.result;
                data["image"] = file.name;
                if (id == "") {
                    addPhotoPosts(data);
                } else {
                    updatePhotoPosts(data);
                }
            };
            reader.readAsDataURL(file);
        } else {
            if (id == "") {
                data["base64"] = '';
                data["image"] = $('#img').val();
                addPhotoPosts(data);
            } else {
                data["base64"] = '';
                data["image"] = $('#img').val();
                updatePhotoPosts(data);
            }
        }
    });

    function addPhotoPosts(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${PhotoPostsURL}";
                alert("Add successfully");
                //console.log(result);
            },
            error: function (error) {
                //window.location.href = "${NewURL}";
                alert("Add failed");
                //console.log(error);
            }
        });
    }

    function updatePhotoPosts(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${PhotoPostsURL}";
                alert("Update successfully");
                //console.log(result);
            },
            error: function (error) {
                //window.location.href = "${NewURL}";
                alert("Update failed");
                //console.log(error);
            }
        });
    }
</script>

</body>
</html>