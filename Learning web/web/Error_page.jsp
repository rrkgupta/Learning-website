<%-- 
    Document   : Error_page
    Created on : Jul 18, 2020, 8:31:36 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sorry something went wrong....</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/Mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 86%, 70% 99%, 30% 87%, 1% 99%, 0 0);
            }
        </style>




    </head>
    <body class="primary_background">
        <div class="container text-center ">
            <img src="img/8700.png" class="img-fluid">  
            <h3 class="display-3">Sorry! something went wrong.</h3>
            <%=exception%>
            <a href="Index.jsp" class="btn  btn-lg text-white mt-3" style="background: red">Home</a>
        </div>
    </body>
</html>
