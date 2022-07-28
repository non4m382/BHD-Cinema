<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BHD Cinema</title>
        <link rel="stylesheet" href="css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
        <link rel="stylesheet" href="css/main.css">
        <script>
            function Onclick(i) {
                var x = document.getElementById("owl-one");
                var y = document.getElementById("owl-two");
                if (i === 1) {
                    x.style.display = "block";
                    y.style.display = "none";

                } else {
                    y.style.display = "block";
                    x.style.display = "none";
                }
            }
        </script>

    </head>

    <body class="home-blog">

        <jsp:include page="header.jsp"></jsp:include>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <img src="img/promotion/1920X1080-HNflashsale.jpg" style="width:100%">
                </div>

                <div class="mySlides fade">
                    <img src="img/promotion/1920x1080bathanghai-1.jpg" style="width:100%">
                </div>

                <div class="mySlides fade">
                    <img src="img/promotion/App.jpg" style="width:100%">
                </div>

                <div class="mySlides fade">
                    <img src="img/promotion/Grab.jpg" style="width:100%">
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <div style="text-align:center; position: absolute;margin-right: auto;left: 0;
                     right: 0;bottom: 24px;">
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                    <span class="dot" onclick="currentSlide(4)"></span>
                </div>
            </div>

            <div class="index" >
                <div class="section_production_view" id="movie_index">
                    <h2 class="product_title">
                        <strong><a onclick="Onclick(1)">PHIM ĐANG CHIẾU</a></strong>
                        <strong>|</strong>
                        <strong><a onclick="Onclick(2)">PHIM SẮP CHIẾU</a></strong>
                    </h2>

                    <div id="owl-one" class="owl-carousel owl-theme">

                    <c:forEach items="${requestScope.movies}" var="m">
                        <div class="movie">
                            <div class="movie_img">
                                <img src="${m.img}" width="100%">
                            </div>
                            <div class="buynow">
                                <h3>
                                    <a href="moviedetail?name=${m.name}">Buy Now</a>
                                </h3>
                            </div>
                        </div>
                    </c:forEach> 
                </div >
                <div id="owl-two" class="owl-carousel owl-theme" style="display: none">
                    <c:forEach items="${requestScope.upcomingmovies}" var="m">
                        <div class="movie">
                            <div class="movie_img">
                                <img src="${m.img}" width="100%">
                            </div>
                            <div class="buynow">
                                <h3>
                                    <a href="moviedetail?name=${m.name}">Buy Now</a>
                                </h3>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>

            <div class="section_promotion">
                <h2 class="promotion_title">
                    <strong>
                        KHUYẾN MÃI
                    </strong>
                    <strong>|</strong>
                    <strong>
                        SỰ KIỆN
                    </strong>
                </h2>
                <div id="owl-three" class="owl-carousel owl-theme">
                    <div><img src="img/promotion/U22-web-1.png"></div>
                    <div><img src="img/promotion/Web-HappyDay.png"></div>
                </div>    
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include> 

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/mycode.js"></script>
    </body>
</html>