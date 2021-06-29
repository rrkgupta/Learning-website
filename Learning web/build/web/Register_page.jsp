<%-- 
    Document   : Register_page
    Created on : Jul 17, 2020, 8:57:41 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
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

        <main class="primary_background  banner-background "style="padding-bottom: 80px ">
            <div class="container">
                <div class="col-md-6 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center primary_background">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here


                        </div> 
                        <div class="card-body">

                            <form id="reg-form" action="Register_servlet" method="post">
                                <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input type="text" name="name" class="form-control" id="exampleInputusername" aria-describedby="usernameHelp" placeholder="Enter username">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select gender</label>
                                    <br>
                                    <input type="radio" id="gender"name="gender" value="male">male
                                    <input type="radio" id="gender"name="gender" value="female">female
                                </div>
                                <div class="form-group">
                                    <textarea name="about"  cols="60"rows="5" placeholder="eneter something about your self"></textarea>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree term and condition</label>
                                </div>
                                <br>
                                <div class="container text-center"id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span> 
                                    <h4>plz wait.....</h4>
                                </div>

                                <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                            </form>

                        </div>

                        <div class="card-footer">



                        </div>

                    </div> 




                </div>  




            </div>




        </main>







        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function () {
                console.log("loaded...");
            $('#reg-form').on('submit', function (event) {
                    event.preventDefault();




                    let form = new FormData(this);



                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register data
                    $.ajax({
                        url: "Register_servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if(data.trim() === 'done')
                                   {
                            swal("Registerd succesfully...we redirect to login page")
                            .then((value) => {
                            window.location="Login_page.jsp"
                           });
                                    
                               }
                               else
                                {
                                        swal(data)
                                }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("something went wrong...")

                        },
                        processData: false,
                        contentType: false



                    });

                });


            });
               
        </script>

    </body>
</html>
