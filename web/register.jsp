<%-- 
    Document   : register
    Created on : Feb 23, 2022, 7:32:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <title>BHD Cinema</title>
        <style>
            #overlay {
                position: absolute;
                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;
                width: 301px;
                height: 72px;
                background: white;
                text-align: center;
                line-height: 72px;
                box-shadow: 2px 3px 4px grey;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:if test="${requestScope.noti}">
            <div id ="overlay">${requestScope.noti}</div>
        </c:if>
        
        <div class="authen_container">
            <div class="signin_container">
                <h1>Login Form</h1>
                <h3>
                    ${requestScope.error}
                    <c:set var="ad" value="${sessionScope.user}"/>
                    ${ad.user_name}
                </h3>
                <form action="login" method="post">
                    <table>
                        <label class="controls">
                            <tr>
                                <td>Enter username:</td>
                                <td>
                                    <input type="text" name="mail" placeholder="Email"/><br/>
                                </td>
                            </tr>
                        </label>
                        <tr>
                            <td>Enter password: </td>
                            <td>
                                <input type="password" name="pass" placeholder="Password"/><br/>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="LOGIN"/>
                </form>
            </div>
            <div class="signup_container">
                <h1>????ng k?? m???i</h1>
                <form action="signup" autocomplete="on" method="post">
                    <table>
                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">H??? (*)</span>
                            </td>
                            <td>
                                <input type="text" name="last_name" required aria-required="true">
                            </td>
                        </label>
                        </tr>

                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">T??n ?????m (*)</span>
                            </td>
                            <td>
                                <input type="text" name="first_name" required aria-required="true">
                            </td>
                        </label>
                        </tr>
                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">Ng??y sinh (*)</span>
                            </td>
                            <td>
                                <input type="date" name="birthdate" required aria-required="true">
                            </td>
                        </label>
                        </tr>
                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">Email (*)</span>
                            </td>
                            <td>
                                <input type="text" name="mail" required aria-required="true">
                            </td>
                        </label>
                        </tr>
                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">M???t kh???u (*)</span>
                            </td>
                            <td>
                                <input type="password" name="password" required aria-required="true">
                            </td>
                        </label>
                        </tr>
                        <tr>
<!--                        <label class="controls">
                            <td>
                                <span class="txt--label">Nh???p l???i m???t kh???u (*)</span>
                            </td>
                            <td>
                                <input type="password" name="repassword" required aria-required="true">
                            </td>
                        </label>-->
                        </tr>
                        <tr>
                        <label class="controls">
                            <td>
                                <span class="txt--label">S??? ??i???n tho???i (*)</span>
                            </td>
                            <td>
                                <input type="number" name="phone" required aria-required="true">
                            </td>
                        </label>
                        </tr>
                    </table>

<!--                    <label class="controls-dieukhoan">
                        <input type="checkbox" name="dieukhoan">T??i ???? ?????c v?? ?????ng ?? v???i c??c 
                        <a href="#">??i???u kho???n</a>
                    </label><br/>

                    <label class="controls-dieukhoan">
                        <input type="checkbox" name="khuyen mai">Nh???n th??ng tin ch????ng tr??nh khuy???n m??i
                    </label><br/>-->

                    <div class ="form-last">
                        <input type="submit" value="????NG K??">
                    </div>
                </form> 
            </div>

        </div>
        <%@include file="promotion.jsp" %>
        <%@include file="footer.jsp" %>
        <script>
            $('#overlay').fadeIn('slow').delay(3000).fadeOut('slow');
        </script>
    </body>
</html>
