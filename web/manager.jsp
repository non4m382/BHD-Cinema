<%-- 
    Document   : manage
    Created on : Mar 8, 2022, 9:43:45 AM
    Author     : Admin
--%>

<%@page import="java.util.HashMap"%>
<%@page import="dal.TransactionDAO"%>
<%@page import="model.Cinema"%>
<%@page import="dal.CinemaDAO"%>
<%@page import="java.util.List"%>
<%@page import="dal.BookingDAO"%>
<%@page import="model.BookingDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://kit.fontawesome.com/2d03399cd6.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/manage.css"/>
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(id, model) {
                if (model === "movies") {
                    if (confirm("Are you sure to delete movie id " + id + "?")) {
                        window.location = "admindeletemovie?id=" + id;
                    }
                }

            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="user" value="${sessionScope.user}"></c:set>
            <div class="manager container-fluid">
                <div class="row">
                    <div class="col-md-2 control float-left admin">
                        <h1>
                            Admin 
                            <span>${user.first_name}</span>
                    </h1>
                    <nav>
                        <ul>
                            <li>
                                <a href="manage?model=general">General</a>
                            </li>
                            <li class="sub-menu"><a href="#crud">CRUD<div class='fa fa-caret-down right'></div></a>
                                <ul>
                                    <li>
                                        <a href ="manage?model=movies">Movie</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=cinemas">Cinema</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=screens">Screen</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=schedules">Schedule</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=screen_details">Screen_detail</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=users">User</a> 
                                    </li>
                                    <li>
                                        <a href ="manage?model=prices">Price</a>
                                    </li>
                                    <li>
                                        <a href ="manage?model=bookings">Booking</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>

                <div class="movie_view col-md-10">

                    <!--Dashboard-->
                    <c:if test="${requestScope.ok != null}" >
                        <c:set value="${requestScope.cinema}" var="ci"></c:set>
                        <c:set value="${requestScope.movie}" var="m"></c:set>
                        <c:set value="${requestScope.booking_detail}" var="u"></c:set>
                            <div class="row justify-content-around" style="margin-bottom: 40px;">
                                <div class="col-md-2 summary" style="background: #e5e942c2">
                                    <h2>
                                    ${requestScope.userss}
                                </h2>
                                <span>
                                    Users
                                </span>
                            </div>
                            <div class="col-md-2  summary">
                                <h2>
                                    ${fn:length(cinema)}
                                </h2>
                                <span>
                                    Cinemas
                                </span>
                            </div>
                            <div class="col-md-2 summary" style="background: #56a9ff">
                                <%
                                    BookingDAO bd = new BookingDAO();
                                    List<BookingDetails> list = bd.getAllBookingDetails();
                                    int sum = 0;
                                    for (BookingDetails b : list) {
                                        sum += b.getPrice() * 1000;
                                    }
                                    request.setAttribute("sum", sum);

                                %>
                                <h2>
                                    VND<fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "3" value = "${requestScope.sum}" />
                                </h2>
                                <span>
                                    Total
                                </span>
                            </div>
                        </div>

                        <div class="row justify-content-around">
                            <div class="col-md-5 doughnut">
                                <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                            </div>
                            <div class="col-md-5 bar">
                                <canvas id="myChart2" style="width:100%;max-width:600px"></canvas>
                            </div>
                        </div>
                    </c:if>

                    <!--Movie-->
                    <c:if test="${requestScope.movies != null}">
                        <h1>List of Movies</h1>
                        <h3><a href="admin/movie/addmovie.jsp">Addnew</a></h3>
                        <table border = "1px" width = "100%">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Describe</th>
                                <th>Image</th>
                                <th>Length_time</th>
                                <th>Type</th>
                                <th>Action</th>
                            </tr>

                            <c:forEach items="${requestScope.movies}" var="m">
                                <tr>
                                    <td>${m.movie_id}</td>
                                    <td>${m.name}</td>
                                    <td>${m.describe}</td>
                                    <td><img src="${m.img}" width="80%"></td>
                                    <td>${m.length_time}</td>
                                    <td>${m.movie_type}</td>
                                    <td>
                                        <a href="#" onclick="doDelete('${m.movie_id}', 'movies')">Delete</a>
                                        <a href="adminupdatemovie?name=${m.name}">Update</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <!--Cinema-->
                    <c:if test="${requestScope.cinemas != null}">
                        <h1>List of Cinemas</h1>
                        <h3><a href="#">Addnew</a></h3>
                        <table border = "1px" width = "100%">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Mail</th>
                                <th>Extra_Price</th>
                            </tr>

                            <c:forEach items="${requestScope.cinemas}" var="ci">
                                <tr>
                                    <td>${ci.id}</td>
                                    <td>${ci.name}</td>
                                    <td>${ci.address}</td>
                                    <td>${ci.phone}</td>
                                    <td>${ci.mail}</td>
                                    <td>${ci.extra_price}</td>
                                    <td>
                                        <a href="#" onclick="doDelete('${ci.id}')">Delete</a>
                                        <a href="#?id=${ci.id}">Update</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <!--Screens-->
                    <c:if test="${requestScope.screens != null}">
                        <h1>List of Screens</h1>
                        <h3><a href="#">Addnew</a></h3>
                        <table border = "1px" width = "100%">
                            <tr>
                                <th>ID</th>
                                <th>CinemaID</th>
                                <th>Screen_number</th>
                                <th>Screen_type</th>
                                <th>Screen_detail_id</th>
                            </tr>

                            <c:forEach items="${requestScope.screens}" var="sc">
                                <tr>
                                    <td>${sc.screen_id}</td>
                                    <td>${sc.cinema_id}</td>
                                    <td>${sc.screen_number}</td>
                                    <td>${sc.screen_type}</td>
                                    <td>${sc.screen_detail_id}</td>
                                    <td>
                                        <a href="#" onclick="doDelete('${sc.screen_id}')">Delete</a>
                                        <a href="#?id=${ci.id}">Update</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <!--Schedules-->
                    <c:if test="${requestScope.schedules != null}">
                        <h1>List of Schedules</h1>
                        <h3><a href="#">Addnew</a></h3>
                        <table border = "1px" width = "100%">
                            <tr>
                                <th>ID</th>
                                <th>MovieID</th>
                                <th>ScreenID</th>
                                <th>ShowingDate</th>
                                <th>StartTime</th>
                            </tr>

                            <c:forEach items="${requestScope.schedules}" var="sch">
                                <tr>
                                    <td>${sch.schedule_id}</td>
                                    <td>${sch.movie_id}</td>
                                    <td>${sch.screen_id}</td>
                                    <td>${sch.showing_date}</td>
                                    <td>${sch.start_time}</td>
                                    <td>
                                        <a href="#" onclick="doDelete('${sc.screen_id}')">Delete</a>
                                        <a href="#?id=${ci.id}">Update</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
        <script>
            <%                                TransactionDAO td = new TransactionDAO();
                HashMap<String, Integer> map = td.getMoney();
                HashMap<String, Integer> map2 = td.getMoneyByMovies();
                request.setAttribute("mapcc", map2);
                request.setAttribute("mapc", map);
            %>

            <c:set value="${mapc}" var="mc"></c:set>
            const labels = [];
            const datas = [];
            <c:forEach items="${mc}" var="mcc">
            labels.push('${mcc.key}');
            datas.push('${mcc.value}');
            </c:forEach>

            var xValues = labels;
            var yValues = datas;
            var barColors = [
                "#b91d47",
                "#00aba9",
                "#2b5797",
                "#e8c3b9",
                "#1e7145"
            ];

            new Chart("myChart", {
                type: "doughnut",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', ],
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Profit per Cinema"
                    }
                }
            });

            <c:set value="${mapcc}" var="mcc"></c:set>
            const labels2 = [];
            const datas2 = [];
            <c:forEach items="${mcc}" var="mccc">
            labels2.push('${mccc.key}');
            datas2.push('${mccc.value}');
            </c:forEach>

            var xValues = labels2;
            var yValues = datas2;
            var barColors = ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', ];

            new Chart("myChart2", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: "Profit per Movie"
                    }
                }
            });
        </script>
        <script>
            $('.sub-menu ul').hide();
            $(".sub-menu a").click(function () {
                $(this).parent(".sub-menu").children("ul").slideToggle("100");
                $(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
            });
        </script>
        <%--<jsp:include page="footer.jsp"></jsp:include>--%>

    </body>
</html>
