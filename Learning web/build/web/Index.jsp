<%-- 
    Document   : Index
    Created on : Jul 16, 2020, 9:44:33 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body>

        <!--navber-->
        <%@include file="normal_navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary_background text-white banner-background">
                <div class="container">
                    <h3 classs="display-3">Welcome to Learnig  </h3>

                    <p>
                        A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms. ... There are programmable machines that use a set of specific instructions, rather than general programming languages.
                    </p>
                    <p>
                        Thousands of different programming languages have been created, and more are being created every year. Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).
                    </p>
                    <button class="btn btn-outline-light"><span class="fa fa-external-link"></span>start ! its free</button>
                    <a href="Login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus fa-spin"></span>Login</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card"">

                        <div class="card-body">
                            <h5 class="card-title">java programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card"">

                        <div class="card-body">
                            <h5 class="card-title">C </h5>C is the most widely used computer language. It keeps fluctuating at number one scale of popularity along with Java programming language, which is also equally popular and most widely used among modern software programmers</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card"">

                        <div class="card-body">
                            <h5 class="card-title">CPP</h5>
                            <p class="card-text">C++ is a cross-platform language that can be used to create high-performance applications.</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card"">

                        <div class="card-body">
                            <h5 class="card-title">PYTHON</h5>
                            <p class="card-text">Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card"">

                        <div class="card-body">
                            <h5 class="card-title">Data Structure and Algorithm</h5>
                            <p class="card-text">Algorithms are generally created independent of underlying languages, i.e. an algorithm can be implemented in more than one programming language..</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Aptitude</h5>
                            <p class="card-text">An aptitude is a component of a competence to do a certain kind of work at a certain level. Outstanding aptitude can be considered "talent." .</p>
                            <a href="Profile.jsp" class="btn primary_background text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>




        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Js/myjs.js" type="text/javascript"></script>
    </body>
</html>
