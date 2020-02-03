<%--
  Created by IntelliJ IDEA.
  User: Vasya
  Date: 12/5/2019
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Language" content="en" />

    <meta name="msapplication-TileColor" content="#2d89ef">
    <meta name="theme-color" content="#4188c9">

    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">

    <title>Login </title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">

    <!-- Dashboard Core -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/assets/css/dashboard.css"/>"/>

</head>
<body>
<div class="page">
    <div class="page-single">
        <div class="container">
            <div class="row">
                <div class="col col-login mx-auto">
                    <c:if test="${regSuccess == 1}">
                        <div class="text-center text-muted">
                            <font color="green">Регистрация прошла успешно!</font>
                        </div>
                    </c:if>
                    <c:if test="${error != null}">
                        <div class="text-center text-muted">
                            <font color="red">${error}</font>
                        </div>
                    </c:if>
                    <form class="card" action="authorization" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="card-body p-6">
                            <div class="card-title">Вход</div>

                            <div class="form-group">
                                <label class="form-label">Логин</label>
                                <input type="text" name="username" class="form-control" id="exampleInputUsername1"
                                       aria-describedby="usernameHelp" placeholder="Введите логин"
                                       pattern="^(?=.*[A-Za-z0-9]$)[A-Za-z][A-Za-z\d.-]{2,20}$"
                                       title="Логин должен содержать от 3 до 20 символов. Могут использоваться только буквы латинского алфавита и цифры">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Пароль
                                </label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Пароль"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{2,30}$"
                                       title="Пароль должен содержать от 3 до 30 символов. Могут использоваться только буквы латинского алфавита и цифры. Должен содержать хотя бы одну цифру и букву!">
                            </div>

                            <div class="form-footer">
                                <button type="submit" class="btn btn-primary btn-block">Войти</button>
                            </div>
                        </div>
                    </form>

                    <div class="text-center text-muted">
                        Все еще нет аккаунта? <a href="goToReg">Зарегистрироваться</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
