<%-- 
    Document   : list
    Created on : Jan 19, 2022, 4:55:18 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        h1, h3 {
            text-align: center;
        }
        
        td {
            text-align: center;
        }

        table {
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
        }
    </style>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you sure to delete category id " + id + "?")) {
                window.location = "admindeletemovie?id=" + id;
            }
        }
    </script>
    <body>
        <h1>List of Movies</h1>
        <h3><a href="admin/movie/addmovie.jsp">Addnew</a></h3>
        <table border = "1px" width = "80%">
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
                        <a href="#" onclick="doDelete('${m.movie_id}')">Delete</a>
                        <a href="adminupdatemovie?name=${m.name}">Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
