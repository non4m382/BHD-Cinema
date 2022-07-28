<%-- 
    Document   : register
    Created on : Feb 23, 2022, 7:32:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" conitent="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            /*            h1 {
                            text-align: center;
                        }
                        
                        .controls label input {
                            padding-left: 100px;
                        }
            
                        .login-container {
                            box-shadow: 1px 1px 5px #797979;
                            background: whitesmoke;
                            width: 30%;
                            margin: auto;
                            border-radius: 10px;
                            padding: 10px;
                        }
                        
                        .login-container form table input {
                            width: 90%;
                        }
                        
                        table {
                            width: 100%;
                        }
                        
                        .form-last {
                            margin: 10px;
                        }
                        
                        .form-last input {
                            display: flex;
                            margin: auto;
                            border-radius: 5px;
                            height: 30px;
                            font-size: 16px;
                        }
            */
        </style>
    </head>
    <body>
        <h1>Add a new Movie</h1>
        <div class="login-container">
            <form action="/movie-prj/adminaddmovie" autocomplete="on" accept-charset="utf-8">
                <table>
                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Name</span>
                        </td>
                        <td>
                            <input type="text" name="name" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Describe</span>
                        </td>
                        <td>
                            <input type="text" name="describe" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Image Link</span>
                        </td>
                        <td>
                            <input type="text" name="img" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Length_time</span>
                        </td>
                        <td>
                            <input type="number" name="length_time" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Movie_type</span>
                        </td>
                        <td>
                            <input type="text" name="movie_type" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Trailer</span>
                        </td>
                        <td>
                            <input type="text" name="trailer" required aria-required="true">
                        </td>
                    </label>
                    </tr>

                    <tr>
                    <label class="controls">
                        <td>
                            <span class="txt--label">Showing From</span>
                        </td>
                        <td>
                            <input type="text" name="showing_from" required aria-required="true">
                        </td>
                    </label>
                    </tr>
                    <tr>


                    <label class="controls">
                        <td>
                            <span class="txt--label">Showing To</span>
                        </td>
                        <td>
                            <input type="text" name="showing_to" required aria-required="true">
                        </td>
                    </label>
                    </tr>
                </table>

                <div class ="form-last">
                    <input type="submit" value="ADD">
                </div>
            </form> 
        </div>

    </body>
</html>
