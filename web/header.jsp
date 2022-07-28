<%-- 
    Document   : header
    Created on : Mar 2, 2022, 11:55:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BHD Cinema</title>
        <link rel="stylesheet" href="css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <div class="header">

            <div id="header_menu" onclick="myMenu('abc')">
                <div>
                    <img alt src="img/header/bg-button-menu.jpg">
                    <img alt src="img/header/bg-button-menu.jpg">
                    <img alt src="img/header/bg-button-menu.jpg">
                    Menu
                </div>

                <div>
                    <ul id="abc" class="subheader">
                        <li><a href="#movie_index">LỊCH CHIẾU</a></li>
                        <li><a href="cinema">HỆ THỐNG RẠP</a></li>
                        <li><a href="">KHUYẾN MÃI|SỰ KIỆN</a></li>
                        <li><a href="">DỊCH VỤ QUẢNG CÁO</a></li>
                        <li><a href="">TUYỂN DỤNG</a></li>
                        <li><a href="">VỀ CHÚNG TÔI</a></li>
                    </ul>
                </div>
            </div>
            <c:set var="ad" value="${sessionScope.user}"/>
            <div>
                <button class="header-button" id="header-button_left">Mua vé</button>
            </div>

            <c:if test="${ad.role == 'admin'}">
                <div class="manager">
                    <button class="header-button">
                        <a href="manage">Manager</a>
                    </button>
                </div>
            </c:if>


            <img id="header_logo" src="img/logo.png" onclick="location.href = 'listmovie';">

            <div class="login_logout">

                <c:if test="${ad == null}">
                    <!--<h3 style="color: red">${requestScope.error}</h3>-->
                    <div class="login">
                        <button class="header-button" id="header-button_right" onclick="myMenu('login_form')">Đăng nhập</button>
                        <form action="login" id="login_form" method="post">
                            <input class="auth" type="text" name="mail" placeholder="Email">
                            <input class="auth" type="password" name="pass" placeholder="Password">
                            <input class="submit_button" type="submit" value="ĐĂNG NHẬP">
                            <a id="forget" href="#">Quên mật khẩu</a><br>
                            <a id="subcribe" href="register.jsp">
                                <p>ĐĂNG KÝ THÀNH VIÊN</p>
                            </a>
                        </form>
                    </div>
                </c:if>
                <c:if test="${ad != null}">
                    <div class="logout">

                        <a href="user?user=${ad.user_id}" style="text-decoration: none">
                            <strong> ${ad.first_name}</strong>
                        </a>

                        <strong>|</strong>
                        <form action="logout" >
                            <input type="submit" name="logout" value="LOG OUT" style="cursor: pointer"/>
                        </form>
                    </div>
                </c:if> 
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/mycode.js"></script>
    </body>

</html>
