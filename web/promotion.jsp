<%-- 
    Document   : promotion
    Created on : Mar 3, 2022, 12:33:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div id="owl-two" class="owl-carousel owl-theme">
                <div><img src="img/promotion/U22-web-1.png"></div>
                <div><img src="img/promotion/Web-HappyDay.png"></div>
            </div>    
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script>
            $('#owl-two').owlCarousel({
                center: true,
                loop: true,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });
        </script>
    </body>
</html>
