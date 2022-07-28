<%-- 
    Document   : user
    Created on : Mar 14, 2022, 11:17:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/user.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User BHDCinema</title>
        <script>
            function HideShowUser(i) {
                x = document.getElementById("user_info");
                if (i === 1) {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="user" value="${requestScope.user}"></c:set>
            <div class="user-title">
                <div class="text-center">
                    <span class="title"onclick="HideShowUser(1)">Thành viên</span>
                    <span>|</span>
                    <span class="title" onclick="HideShowUser(0)">Giao dịch</span>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-6 user" id="user_info">
                        <div class="user_general">
                            <h2 style="margin: 20px 2px;">
                                Thông tin thành viên
                            </h2>
                            <span>${user.last_name} ${user.first_name}</span>
                        <span style="color: #e6b645bd; float: right">Tổng chi tiêu trong tháng
                            <span style="color: #cdb61c">
                                <fmt:formatNumber type = "number" 
                                                  maxFractionDigits = "3" value = "${requestScope.sum}"/>
                                VND
                            </span>

                        </span>
                    </div>
                    <div class="user_info" >
                        <form>
                            <table>
                                <tr>
                                    <td class="user_property">
                                        <span>Email</span>
                                    </td>
                                    <td>
                                        <input class="info" value="${user.mail}" disabled=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="user_property">
                                        <span>Mật khẩu</span>
                                    </td>
                                    <td>
                                        <input class="info" type="password" value="${user.password}" disabled=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="user_property">
                                        <span>Họ</span>
                                    </td>
                                    <td>
                                        <input class="info" value="${user.last_name}" disabled=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="user_property">
                                        <span>Tên</span>
                                    </td>
                                    <td>
                                        <input class="info" value="${user.first_name}" disabled=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="user_property">
                                        <span>Số điện thoại</span>
                                    </td>
                                    <td>
                                        <input class="info" value="${user.phone}" disabled=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="user_property">
                                        <span>Ngày sinh</span>
                                    </td>
                                    <td>
                                        <input class="info" value="${user.birthday}" disabled=""/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="transaction col-md-12">
                    <h2>
                        Transactions
                    </h2>
                    <table>
                        <tr>
                            <th>
                                Transaction Number
                            </th>
                            <th>
                                Transaction Time
                            </th>
                            <th>
                                Site
                            </th>
                            <th>
                                Quantity
                            </th>
                            <th>
                                Spent
                            </th>
                            <th>
                                Movie
                            </th>
                        </tr>
                        <c:forEach var="t" items="${requestScope.booking}">
                            <tr>
                                <td style="padding-left: 8px">${t.transaction_id}</td>

                                <td>${t.made_time}</td>

                                <td>${t.cinema_name}</td>

                                <td style="text-align: center;">1</td>

                                <td style="text-align: center;">
                                    <fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "5" 
                                                      value = "${t.price * 1000}"/> 
                                    <span>VND</span>
                                </td>

                                <td>
                                    ${t.movie_name}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
