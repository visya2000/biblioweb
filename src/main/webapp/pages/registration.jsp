<%--
  Created by IntelliJ IDEA.
  User: Vasya
  Date: 12/10/2019
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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



    <title>Registration </title>

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
                    <form class="card" action="regCheck" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <div class="card-body p-6">
                            <c:if test="${wrong == 1}">
                                <div class="text-center text-muted">
                                    <font color="red">Пароли должны совпадать!</font>
                                </div>
                            </c:if>
                            <div class="card-title">Регистрация</div>

                            <div class="form-group">
                                <label class="form-label">Логин</label>
                                <input type="text" name="username" class="form-control" id="exampleInputUsername1" aria-describedby="usernameHelp" placeholder="Введите логин" required
                                       pattern="^(?=.*[A-Za-z0-9]$)[A-Za-z][A-Za-z\d.-]{2,20}$" autocomplete="off"
                                       title="Логин должен содержать от 3 до 20 символов. Могут использоваться только буквы латинского алфавита и цифры"
                                       value="${login}">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Пароль
                                </label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Пароль" autocomplete="off" required
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{2,30}$"
                                       title="Пароль должен содержать от 3 до 30 символов. Могут использоваться только буквы латинского алфавита и цифры. Должен содержать хотя бы одну цифру и букву!">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Повторите пароль
                                </label>
                                <input type="password" name="rep_password" class="form-control" id="exampleInputPassword2" placeholder="Повтор пароля" autocomplete="off" required
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{2,30}$"
                                       title="Пароль должен содержать от 3 до 30 символов. Могут использоваться только буквы латинского алфавита и цифры. Должен содержать хотя бы одну цифру и букву!">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Имя
                                </label>
                                <input type="text" name="name" class="form-control" id="name1" placeholder="Имя" autocomplete="off" required
                                       pattern="^[а-яё]{2, 30}|[a-z]{2, 30}$/iu"
                                       title="Имя должно содержать не больше 30 символов. Могут использоваться буквы латинского алфавита и кириллица"
                                       value="${name}">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Фамилия
                                </label>
                                <input type="text" name="surname" class="form-control" id="surname1" placeholder="Фамилия" autocomplete="off" required
                                       pattern="^[а-яё]{2, 30}|[a-z]{2, 30}$/iu"
                                       title="Фамилия должна содержать не больше 30 символов. Могут использоваться буквы латинского алфавита и кириллица"
                                       value="${surname}">
                            </div>

                            <div class="form-group">
                                <label class="form-label">
                                    Возраст
                                </label>
                                <input type="text" name="age" class="form-control" id="age1" placeholder="Возраст" autocomplete="off" required
                                       pattern="^(?:1(?:00?|\d)|[1-9]\d|[6-9]\d?)$"
                                       title="Возраст может содержать только числа от 10 до 100"
                                       value="${age}">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Телефон
                                </label>
                                <input type="text" name="phone" class="form-control" id="phone1" placeholder="Телефон" autocomplete="off"
                                       pattern="^(\+\d{1,3}[- ]?)?\d{10}$"
                                       title="Введите телефон в формате +3..."
                                       value="${phone}">
                            </div>
                            <div class="form-group">
                                <label class="form-label">
                                    Email
                                </label>
                                    <input type="text" name="email" class="form-control" id="email1" placeholder="email" autocomplete="off" required
                                           pattern="^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"
                                           title="Введите корректный email"
                                           value="${email}">
                            </div>
                            <div class="form-footer">
                                <button type="submit" class="btn btn-primary btn-block">Зарегистрироваться</button>
                            </div>
                        </div>


                    </form>


                    <div class="text-center text-muted">
                        Уже есть аккаунт? <a href="goToLogin">Войти</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
