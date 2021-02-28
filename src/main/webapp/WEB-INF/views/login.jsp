<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src='<c:url value="/template/login/images/img-01.png"/>' alt="IMG">
            </div>
            <form class="login100-form validate-form" action="j_spring_security_check" id="formLogin" method="post">
                <span class="login100-form-title">
                    Login
                </span>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" id="userName" name="j_username" placeholder="Username">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
					    <i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" id="password" name="j_password" placeholder="Password">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" type="submit">
                        Login
                    </button>
                </div>

                <div class="text-center p-t-12">
                    <span class="txt1">
                        Forgot
                    </span>
                    <a class="txt2" href="#">
                        Username / Password?
                    </a>
                </div>
                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                        Username or password incorrect
                    </div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                        you Not authorize
                    </div>
                </c:if>
                <div class="text-center p-t-136">
                    <a class="txt2" href="#">
                        Create your Account
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>