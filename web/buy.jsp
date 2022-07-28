<%-- 
    Document   : buy
    Created on : Mar 12, 2022, 1:15:53 AM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dal.ScreenDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fnt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/buy.css"/>
        <title>JSP Page</title>
        <style>
            .disableselect{
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                      supported by Chrome, Edge, Opera and Firefox */
            }

            ::placeholder {
                color: white;
                opacity: 1; 
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="booking_master">
            <form action="checkout" class="form">
                <input type="hidden" id="price" value="${requestScope.price}"/>
                <!-- Steps -->
                <div class="container">
                    <!-- Progress bar -->
                    <div class="progressbar">
                        <div class="progress" id="progress"></div>
                        <div class="progress-step progress-step-active" data-title="Chọn ghế"></div>
                        <!--<div class="progress-step" data-title="Chọn đồ ăn"></div>-->
                        <div class="progress-step" data-title="Xác nhận"></div>
                        <!--<div class="progress-step" data-title="Đặt vé thành công"></div>-->

                    </div>
                    <!--Booking UI-->
                    <div class="row booking_UI">
                        <div class="col-md-9 ticket_booking">
                            <c:set var="m" value="${requestScope.movie}"/>
                            <c:set var="sc" value="${requestScope.schedule}"/>
                            <c:set var="ci" value="${requestScope.cinema}"/>
                            <c:set var="s" value="${requestScope.screen}"/>
                            <c:set var="sd" value="${requestScope.screenDetail}"/>
                            <input type="hidden" name="schedule_id" value="${sc.schedule_id}"/>
                            <!--1. Chọn ghế-->
                            <div class="form-step form-step-active seat_booking">
                                <div class="movie_info">
                                    <div class="booking_movie_img">
                                        <img src="${m.img}">
                                    </div>
                                    <div class="booking_movie_detail">
                                        <h4>
                                            ${m.name}
                                        </h4>
                                        <p>
                                            Showing on ${sc.showing_date} ${sc.start_time} 
                                            <br/>
                                            ${ci.name} - Screen ${s.screen_number}
                                        </p>
                                    </div>
                                </div>
                                <div class="seat_available">
                                    <h3>
                                        Vui lòng chọn ghế trong sơ đồ ghế phía dưới.
                                    </h3>
                                    <ul class="showcase">
                                        <li>
                                            <div class="seats"></div>
                                            <small>N/A</small>
                                        </li>

                                        <li>
                                            <div class="seats selected"></div>
                                            <small>Selected</small>
                                        </li>

                                        <li>
                                            <div class="seats occupied"></div>
                                            <small>Occupied</small>
                                        </li>
                                    </ul>

                                    <c:set var="listS" value="${requestScope.seatsList}" />

                                    ${test}
                                    <div class="seat_container">
                                        <div class="whitescreen"></div>
                                        <c:forEach items="${requestScope.rows_alphabet}" var="r">
                                            <div class="rows ">
                                                <span class="alphabet_rows">${r}</span>
                                                <c:forEach begin="1" end="${sd.seats}" var="sts">
                                                    <c:set var="sid" value="${r}${sts}"></c:set>
                                                        <input type="text" 
                                                               class="${fnt:contains(listS, sid) ? 
                                                                 'seats disableselect occupied' : 'seats disableselect'}" 
                                                        id="${sid}" readonly="" placeholder="${sts}"></input>
                                                    <!--<input type="hidden">-->
                                                </c:forEach>
                                                <span class="alphabet_rows">${r}</span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div id="test_area"></div>

                                <div>
                                    <a style="display: none" class="btn btn-next width-50 ml-auto" 
                                       id="foodNextButton" onclick="topFunction()">Next</a>
                                </div>
                            </div>


                            <!--                            2. Chọn đồ ăn
                                                        <div class="form-step food_booking">
                                                            <div class="input-group">
                                                                <label for="phone">Phone</label>
                                                                <input type="text" name="phone" id="phone" />
                                                            </div>
                                                            <div class="input-group">
                                                                <label for="email">Email</label>
                                                                <input type="text" name="email" id="email" />
                                                            </div>
                                                            <div class="btns-group">
                                                                <a href="#" class="btn btn-prev">Previous</a>
                                                                
                                                                <a href="#" class="btn btn-next">Next</a>
                                                            </div>
                                                        </div>-->

                            <!--3. Xác nhận-->
                            <div class="form-step">
                                <!--                                <div class="input-group">
                                                                    <label for="dob">Date of Birth</label>
                                                                    <input type="date" name="dob" id="dob" />
                                                                </div>
                                                                <div class="input-group">
                                                                    <label for="ID">National ID</label>
                                                                    <input type="number" name="ID" id="ID" />
                                                                </div>-->
                                <div>
                                    <h2>Hãy chắc chắn đã chọn đúng số ghế</h2>
                                    <h2></h2>
                                </div>
                                <div class="btns-group">
                                    <a href="#" class="btn btn-prev">Previous</a>
                                    <!--<a href="#" class="btn btn-next">Next</a>-->
                                    <button class="btn btn-next" type="submit" value="Confirm">Confirm</button>
                                </div>
                            </div>
                            <!--                            4. Đặt vé thành công
                                                        <div class="form-step">
                                                            <div class="input-group">
                                                                <label for="password">Password</label>
                                                                <input type="password" name="password" id="password" />
                                                            </div>
                                                            <div class="input-group">
                                                                <label for="confirmPassword">Confirm Password</label>
                                                                <input type="password" name="confirmPassword" id="confirmPassword" />
                                                            </div>
                                                            <div class="btns-group">
                                                                <a href="#" class="btn btn-prev">Previous</a>
                                                                <input type="submit" value="Submit" class="btn" />
                                                            </div>
                                                        </div>-->
                        </div>

                        <!--Shopping Cart-->
                        <div class="col-md-3 shopping_cart">
                            <div class="cart_info">
                                <h3 style="font-size: large">
                                    Giỏ hàng của bạn
                                </h3>
                                <div class="items_chosen">
                                    <span>
                                        ${m.name}
                                    </span>

                                    <p class="text" id="cart_ticket">
                                        <span>
                                            Adult Standard 2D
                                        </span>
                                        <span style="float: right">
                                            <span id="count" style="color: #89c441">0</span><span id="movie_total">0</span>
                                        </span>

                                    </p>
                                    <div class="total_price">
                                        Tổng cộng 
                                        <span style="float: right">
                                            VND<span id="grand_total">0</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="numeral.min.js"></script>
        <script src="js/buy.js"></script>
        <script>
                                           function topFunction() {
                                               document.body.scrollTop = 0;
                                               document.documentElement.scrollTop = 0;
                                           }

                                           function updateSeatID() {
                                               const collection = document.getElementsByClassName("selected");
                                               let text = "";
                                               if (collection.length === 0) {
                                                   text = "";
                                               } else {
                                                   for (let i = 0; i < collection.length; i++) {
                                                       text += collection[i].id + "-";
                                                   }
                                               }

                                               var z = document.getElementById("seat_string");
                                               if (!document.body.contains(z)) {
                                                   var objTo = document.getElementById('test_area');
                                                   var x = document.createElement("INPUT");
                                                   x.setAttribute("type", "hidden");
                                                   x.setAttribute("id", "seat_string");
                                                   x.setAttribute("name", "cdf");
                                                   x.setAttribute("value", text);
                                                   objTo.appendChild(x);
                                               } else {
                                                   z.value = text;
                                               }
                                           }

                                           function allowNextButton() {
                                               var z = document.getElementById("seat_string");
                                               var f = document.getElementById("foodNextButton");
                                               var g = document.getElementById("cart_ticket");
                                               if (z.value) {
                                                   if (z.value !== "-") {
                                                       f.style.display = "block";
                                                       g.style.display = "block";
                                                   } else {
                                                       f.style.display = "none";
                                                       g.style.display = "none";
                                                   }
                                               } else {
                                                   f.style.display = "none";
                                                   g.style.display = "none";
                                               }
                                           }
        </script>
    </body>
</html>
