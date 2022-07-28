<%-- 
    Document   : login
    Created on : Feb 15, 2022, 9:33:37 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login Form</h1>
        <h3>
            ${requestScope.error}
            <c:set var="ad" value="${sessionScope.user}"/>
            ${ad.user_name}
        </h3>
        <form action="login" method="post">
            Enter username: <input type="text" name="mail" placeholder="Email"/><br/>
            Enter password: <input type="password" name="pass" placeholder="Password"/><br/>
            <input type="submit" value="LOGIN"/>
        </form>
    </body>
</html>
