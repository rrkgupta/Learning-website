<%-- 
    Document   : Profile
    Created on : Jul 18, 2020, 10:37:20 AM
    Author     : Administrator
--%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="Error_page.jsp" %>

<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("Login_page.jsp");
    }
    








%>

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
        <!--navbar-->
        
        <nav class="navbar navbar-expand-lg navbar-dark primary_background">
            <a class="navbar-brand" href="Index.jsp"><span class="fa fa-address-book"></span>Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Profile.jsp"><span class="fa fa-window-minimize"></span>All Post<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-reorder"></span>
                            Categoties
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">data structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">more</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contact</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#exampleModal"><span class="fa fa-address-book-o"></span> Do Post</a>
                    </li>
                    <form action="Translate" class="form-inline my-2 my-lg-0" method="post">
      <input name="word" class="form-control mr-sm-2" type="search" placeholder="Translate EN to HI" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">hindi</button>
    </form>
                    
                   
                </ul>
                <ul class="navbar-nav mr-right">
                    
                     <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModalLong"> <span class="fa fa-user-circle "></span>></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logoutservlet"> <span class="fa fa-user-plus "></span>></span>Logout</a>
                    </li>
                    
                    
                </ul>
            </div>
        </nav>
                     <%
                                 Message m=(Message)session.getAttribute("msg");
                                 if(m!=null)
                                 {
                                     %>

                            </div>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                               <%=m.getContent() %>
                            </div>
                                     
                                     
                                     
                                     <%
                                         
                                         session.removeAttribute("msg");
                                         
                                 }
                                    
                                    
                                    
                                    %>
                                    
                                     <%
                                 Message sg=(Message)session.getAttribute("msg1");
                                 if(sg!=null)
                                 {
                                     %>

                            </div>
                            <div class="alert <%= sg.getCssClass()%>" role="alert">
                               <%=sg.getContent() %>
                            </div>
                                     
                                     
                                     
                                     <%
                                         
                                         session.removeAttribute("msg1");
                                         
                                 }
                                    
                                    
                                    
                                    %>
                                    
                                    
                                    
                                  
              <!--main body--> 
              <main style="background-color:#424242">
                    <ul class="nav nav-tabs" style="background-color:#263238">
                      <%
                                                Postdao daooo=new Postdao(ConnectionProvider.getConnection());
                                                ArrayList<Category> listii=daooo.getAllcategory();
                                                for(Category ccc: listii)
                                                {
                                                    
                                                
                                                %>
                                          <li class="nav-item">
                          <a class="c-link nav-link active" href="#" onclick="getpost(<%= ccc.getCid()%>,this)"> <%=ccc.getName()%></a>
                      </li>
                                            <%
                                            }
                                            
                                            %>
                      
</ul>
                
                  <div class="container" style="background-color:#424242">  
                    <div class="row mt-7">
                     <!--fiest cols-->
                    
                         
                         
                     </div>
                     <!--2nd cols-->
                      <div class="col-md-30">
                          <!--post-->
                          <div class="container text-center" id="loader">
                           
                                <i class="fa fa-refresh fa-4x fa-spin "></i>  
                              <h3 class="mt-3">Loading........</h3>
                          </div> 
                          <div class="container-fluid" id="post-container">
                              
                              
                              
                              
                          </div>
                         
                     </div>
                    
                        
                        
                        
                   </div>
                      </div> 
                  
              </main>
              
              
              
              
              
              <!--end of main body-->
                                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <!--Profile modal-->
                 
                 

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                          <div class="modal-content">
                              <div class="modal-header primary_background text-white text-center">
                                  <h5 class="modal-title" id="exampleModalLongTitle">TechBlog</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body">
                                  <div class="container text-center">
                                      <img src="images/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;">
                                      <h5 class="modal-title" id="exampleModalLongTitle"><%=user.getName()%></h5>
                                      <!--table-->
                                      <div id="profile-detail">
                                      <table class="table">
                                         
                                          <tbody>
                                              <tr>
                                                  <th scope="row">ID:</th>
                                                  <td> <%= user.getId() %></td>
                                                  
                                              </tr>
                                              <tr>
                                                  <th scope="row">Email:</th>
                                                  <td><%= user.getEmail() %></td>
                                                  
                                              </tr>
                                              <tr>
                                                  <th scope="row">gender:</th>
                                                  <td><%= user.getGender() %></td>
                                                  
                                              </tr>
                                              <tr>
                                                  <th scope="row">Status:</th>
                                                  <td><%= user.getAbout() %></td>
                                                  
                                              </tr>
                                               <tr>
                                                  <th scope="row"> Register On:</th>
                                                  <td><%= user.getDatatime().toString() %></td>
                                                  
                                              </tr>
                                          </tbody>
                                      </table>
                                      </div>
                                      <!-- end of table-->
                                      <!-- profile edit-->
                                      <div id="profile-edit" style="display: none;">
                                          <h2 class="mt-2"> Plz edit carefully</h2>
                                          <form action="Editservlet" method="post" enctype="multipart/form-data">
                                              <table class="table" >
                                                  <tr>
                                                  <td>ID :</td>
                                                  <td > <%= user.getId() %></td>
                                                  
                                              </tr> 
                                               <tr>
                                                  <td>Name :</td>
                                                  <td> <input type="text" class="form-control" name="name" value="<%= user.getName() %>"></td>
                                                  
                                              </tr> 
                                               <tr>
                                                  <td>email :</td>
                                                  <td> <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>"></td>
                                                  
                                              </tr> 
                                               <tr>
                                                  <td>Password :</td>
                                                  <td> <input type="Password" class="form-control" name="password" value="<%= user.getPassword() %>"></td>
                                                  
                                              </tr> 
                                               <tr>
                                                  <td>Gender :</td>
                                                  <td> <%= user.getGender().toUpperCase() %>></td>
                                                  
                                              </tr> 
                                              <tr>
                                                  <td>About :</td>
                                                  <td> 
                                                      <textarea row="3" class="form-control" name="about"> <%= user.getAbout()%>
                                                          
                                                     
                                                      </textarea>
                                                  
                                                  
                                                  </td>
                                                  
                                              </tr> 
                                              <tr>
                                                  <td>New profile pic:</td>
                                                  <td> 
                                                      <input type="file" name="file" class="for-control">
                                                  
                                                  </td>
                                                  
                                              </tr> 
                                                  
                                            
                                              </table> 
                                              
                                                      <div class="container">
                                                          <button type="submit" class="btn btn-outline-primary">Save</button>
                                                        
                                                      </div>
                                          
                                          </form>
                                          
                                   
                                      </div>
                                      
                                      
                                 
                                      
                                      <!-- end of profile edit-->
                                      
                                  </div>
                                  
                              </div>
                              <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                  <button id="edit-profile-buttton"type="button" class="btn btn-primary">edit</button>
                              </div>
                          </div>
                      </div>
                  </div>
                    <!--end of Profile modal-->
                      <!--start post modal-->
                    
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">provide post details</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="postdetail"  action="Addpostservlet" method="post">
                                        <select class="form-control" name="cid">
                                            <option selected disabled>--- selct catrgory--</option>
                                            <%
                                                Postdao dao=new Postdao(ConnectionProvider.getConnection());
                                                ArrayList<Category> list=dao.getAllcategory();
                                                for(Category c: list)
                                                {
                                                    
                                                
                                                %>
                                            <option value="<%=c.getCid() %>"> <%=c.getName()%> </option>
                                           
                                            <%
                                            }
                                            
                                            
                                            %>
                                            
                                            
                                            
                                        </select>
                                        
                                        
                                        <div class="form-group">
                                            <input type="text" name="ptitle" placeholder="Enter post title" class="form-control"/>
                                        </div>
                                         <div class="form-group">
                                             <textarea name="pcontent" class="form-control" style="height: 200px;" placeholder="enter your content"></textarea>
                                        </div>
                                         <div class="form-group">
                                             <textarea name="pcode" class="form-control" style="height: 200px;" placeholder="enter your program"></textarea>
                                        </div>
                                         <div class="form-group">
                                             <label>select your pic</label>
                                             <br>
                                             <input type="file" name="pic">
                                        </div>
                                             <div class="container text-center">
                                                 <button type="submit"  class="btn btn-outline-primary">
                                                     post
                                                 </button>
                                             
                                        </div>
                                        
                                        
                                    </form>
                                   
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                      <!--end of post modal-->


          
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Js/myjs.js" type="text/javascript"></script>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       <script>
           $(document).ready(function(){
               let editStatus = false;
               $("#edit-profile-buttton").click(function()
               {
                   
                   
                 if(editStatus == false)
                   {
                       $("#profile-detail").hide();
                  $("#profile-edit").show();
                  editStatus=true;
                  $(this).text("Back");
                  
                   }
                   else{
                        $("#profile-detail").show();
                  $("#profile-edit").hide();
                  editStatus=false;
                  $(this).text("edit");
                       
                       
                   }
                   
                     
                   
                   
               }); 
               
        
           });
           
           
           
           
       </script>
       <!-- add post using js-->
       <script>
           
            $(document).ready(function(e){
                   $("#postdetail").on("submit",function(event){
                   event.preventDefault();
                   console.log("u have  clicked on submit");
                   let form=new FormData(this);
                   $.ajax({
                       
                        url: "Addpostservlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            
                             console.log(data);
                         if(data.trim()=='done')
                         {
                             swal("Good job!", "saves successfully", "success");
                         }
                         else
                         {
                         swal("error", "something went wrong", "error");
                         }
                       
                            
                        },
                         error: function (jqXHR, textStatus, errorThrown) {
                          swal("error", "something went wrong", "error"); 
                        },
                        processData: false,
                        contentType: false
                       
                       
                       
                       
                       
                   });
                   
                   
                   
                   
                   
               });
           });
           
        
       </script>
       <!-- loading post using ajax-->
       <script>
           function getpost(catId,temp){
               $("#loader").show();
              $("#post-container").hide();
              $(".c-link").removeClass('active')
                 $.ajax({
                  url: "Loadpost.jsp",
                  data:{cid:catId},
                     success: function (data, textStatus, jqXHR) {
                            
                             console.log(data);
                             $("#loader").hide();
                             $("#post-container").show();
                            
                             $("#post-container").html(data);
                             $(temp).addClass('active');
                       
                 
    }
                 
             });
           }
           $(document).ready(function(e){
               let allpostref= $('.c-link')[0];
       
               getpost(0, allpostref);
               
           });
           
           
           
           
           
           
           
           
           
       </script> 
       
       
       
 
           
                        
                     
                      
                       
                    
    </body>
</html>
