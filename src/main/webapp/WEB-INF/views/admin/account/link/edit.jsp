<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api/link"/>
<c:url var="LinkURL" value="/admin/account/link"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Link</title>
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="font-weight-bold text-danger">Link</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item">Dashboard</li>
                    <li class="breadcrumb-item active">Link</li>
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
                    <label class="col-sm-3 control-label no-padding-right">Phone
                        - <i class="fas fa-phone"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="phone" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Youtube
                        - <i class="fab fa-youtube"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="youtube" cssClass="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Facebook
                        - <i class="fab fa-facebook"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="facebook" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Twitter
                        - <i class="fab fa-twitter"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="twitter" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Instagram
                        - <i class="fab fa-instagram"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="instagram" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Pinterest
                        - <i class="fab fa-pinterest"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="pinterest" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Shoppe
                        - <i class="fas fa-shopping-bag"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="shoppe" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Etsy
                        - <i class="fab fa-etsy"></i>
                    </label>
                    <div class="col-sm-12">
                        <form:input path="etsy" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Banner Below (recommended 930x180)</label>
                    <div class="col-sm-12">
                        <input type="button" id="btn" value="Browse Server" onclick="BrowseServer()">
                        &nbsp; <input type="file" id="bannerBelow" name="bannerBelow"
                                      style="max-width: inherit;"
                                      accept="image/png, image/jpeg, image/jpg"
                                      onchange="readURLBanner(this);"/>
                    </div>
                    <br>
                    <c:if test="${not empty model.id}">
                        <div class="form-group col-sm-12">
                            <img id="blahBanner"
                                 src='<c:url value="/images/${model.bannerBelow}"/>'
                                 alt="your image" style="border: 0.1px solid black;"
                                 width="220px" height="132px">
                        </div>
                    </c:if>
                    <c:if test="${empty model.id}">
                        <div class="form-group col-sm-12">
                            <img id="blahBanner" src="http://placehold.it/220x132"
                                 alt="your image" style="border: 0.1px solid black;"
                                 width="220px" height="132px"/>
                        </div>
                    </c:if>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Link
                        Banner</label>
                    <div class="col-sm-12">
                        <form:input path="linkBanner" cssClass="form-control"/>
                    </div>
                </div>

                <br>
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="button" class="btn btn-white btn-primary btn-bold"
                               value="Update Link" id="btnUpdateLink"/>
                    </div>
                </div>
                <form:hidden path="id" id="id"/>
                <form:hidden path="bannerBelow" id="img"/>
            </form:form>
        </div>
    </div>
</section>


<script>
    function BrowseServer() {
        var finder = new CKFinder();
        finder.basePath = "../";
        finder.selectActionFunction = SetFileField;
        finder.popup();
    }

    function SetFileField(fileUrl) {
        var filename = fileUrl.split('/').pop().split('?')[0].split('#')[0];
        $('#img').val(filename);
        $('#blahBanner').attr('src', fileUrl);
    }/*
	function clickChooseImageBanner(img) {
		$('#bannerBelow').val(img);
		$('#blahBanner').attr('src', '<c:url value="/images/'+img+'"/>');
	} */

    function readURLBanner(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blahBanner').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    function create(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${LinkURL}";
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

    function update(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${LinkURL}";
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

    $('#btnUpdateLink').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        var id = $('#id').val();


        var file = $('#bannerBelow')[0].files[0];
        if (file != undefined) {
            var reader = new FileReader();
            reader.onload = function (e) {
                data["base64"] = e.target.result;
                data["bannerBelow"] = file.name;
                if (id == "") {
                    create(data);
                } else {
                    update(data);
                }
            };
            reader.readAsDataURL(file);
        } else {
            if (id == "") {
                data["base64"] = '';
                data["bannerBelow"] = $('#img').val();
                create(data);
            } else {
                data["base64"] = '';
                data["bannerBelow"] = $('#img').val();
                update(data);
            }
        }


    });


</script>
</body>
</html>