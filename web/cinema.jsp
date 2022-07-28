<%-- 
    Document   : cinema
    Created on : Mar 21, 2022, 8:23:36 AM
    Author     : Admin
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="dal.CinemaDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div>
                <h1 class="text-center">Hệ thống rạp</h1>
                <div class="container text-center ">
                    <div class="row text-center justify-content-around">

                    <c:forEach items="${requestScope.cities}" var="city">
                        <span class="col-md-3">
                            <form action="cinema" method="post">
                                <button type="submit">
                                    <input type="hidden" value="${city}" name="cityy"/>
                                    ${city}
                                </button>
                            </form>
                        </span>
                    </c:forEach>
                </div>
                <c:if test="${requestScope.cinemas != null}">
                    <div class="row text-center justify-content-around">
                        <c:forEach items="${requestScope.cinemas}" var="ci">
                            <div class="col-md-3">
                                <form action="cinema" method="post">
                                    <button type="submit">
                                        <input type="hidden" value="${ci.name}" name="cinema-name"/>

                                        ${ci.name}
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <%@page info="test page" session="false"%>
                <%@page session="false"%>


            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
