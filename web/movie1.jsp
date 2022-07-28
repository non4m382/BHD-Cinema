<%-- 
    Document   : movie
    Created on : Mar 7, 2022, 8:59:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/main.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>BHD Cinema</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="movie_container">
            <c:set var="m" value="${requestScope.movie}"/>
            <div class="movie_nav container">
                <h3><a href="listmovie">Trang chủ</a></h3> 
                <h3>|</h3>
                <h3>${m.name}</h3>
            </div>
            &nbsp;
            <div class="movie_content container">
                <div class="row">
                    <div class="movie_img col-md-4 col-sm-4">
                        <img src="${m.img}">
                    </div>

                    <div class="movie_view col-md-8 col-sm-8">
                        <div class="movie_name">
                            <h3>${m.name}</h3>
                        </div>
                        &nbsp;
                        <div class="movie_detail">
                            <p>${m.describe}</p>
                        </div>
                        &nbsp;
                        <ul class="movie-info">
                            <li>
                                <span>Phân loại: </span>
                                <span style="color: red; font-weight: bold">${m.movie_type}</span>
                            </li>
                            <!--                            <li>
                                                            <span>Đạo diễn: </span>
                                                            <span></span>
                                                        </li>
                                                        <li>
                                                            <span>Diễn viên: </span>
                                                            <span></span>
                                                        </li>
                            -->
                            <li>
                                <span>Thể loại: </span>
                                <c:forEach items="${requestScope.category}" var="cate">
                                    <span>${cate}</span>
                                </c:forEach>
                                
                            </li>
                            <li>
                                <span>Khởi chiếu: </span>
                                <span>${m.showing_from_date}</span>
                            </li>
                            <li>
                                <span>Thời lượng: </span>
                                <span>${m.length_time} phút</span>
                            </li>
                            <li>
                                <span>Ngôn ngữ: </span>
                                <span>Phụ đề tiếng việt</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> 
            &nbsp;&nbsp;
            <div class="movie_ticket container">
                <div class="notification text-center">
                    <h3>
                        VUI LÒNG CHỌN THÔNG TIN VÉ
                    </h3>
                </div>
                <!--tabs-->
                <div class="tabs container" id="tabs-total">
                    <c:forEach items="${showing_hour}" var="map">
                        <fmt:formatDate pattern = "dd-MM" value = "${map.key}" var="ddMM"/>
                        <div class="tab">
                            <input type="radio" class="show_time tab" id="${ddMM}" name="tab_group" onclick="getHeight('${map.value.size()}')">
                            <label for="${ddMM}">
                                <p>
                                    ${ddMM}
                                </p>
                                <p>
                                    <fmt:formatDate pattern = "EEE" value = "${map.key}" />
                                </p>
                            </label>
                            <div class="content col-sm-11">
                                <c:if test ="${map.value.size() == 0}">
                                    <h1>
                                        Phim đã chọn chưa có suất chiếu hoặc đã hết suất chiếu
                                    </h1>
                                </c:if>
                                <input type="hidden" value="${fn:length(map.value)}" id="tabs-height"/>
                                <c:forEach items="${map.value}" var="map_key">
                                    <div class="row cinema_hour" id="${ddMM}">
                                        <div class="col-sm-2 cinema_detail">
                                            <h5>
                                                ${map_key.cinema.name}
                                            </h5>
                                            <span>
                                                ${map_key.cinema.address}
                                            </span>
                                            <span style="display: block">
                                                Screen: ${map_key.screen.screen_number}
                                            </span>
                                        </div>
                                        <div class="col-sm-8">
                                            <c:set value="${map_key.schedule_list}" var="ade"></c:set>

                                            <c:forEach items="${map_key.schedule_list}" var="h">
                                                <a class="col-sm-2 hour" href="buy?cinema=${map_key.cinema.id}&schedule=${h.schedule_id}">
                                                    ${h.start_time}
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div style="height: 10px; position: relative;">
                                        <div id="borderBottom"></div>
                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>

        <script>
            function getHeight(i) {
                var z = document.getElementById('tabs-total');
                z.style.minHeight = parseInt(i) * 250 + 300 + "px";
            }
            var y = document.getElementById('tabs-height').value;
            var z = document.getElementById('tabs-total');
            var s = Number(y);
            z.style.minHeight = s * 250 + 300 + "px";

            document.getElementsByName('tab_group')[0].checked = true;
        </script>
    </body>
</html>
