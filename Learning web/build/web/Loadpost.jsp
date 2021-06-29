<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row">
<%
    Thread.sleep(1000);
  Postdao daoo = new Postdao(ConnectionProvider.getConnection());
  int cid = Integer.parseInt(request.getParameter("cid"));
  List<Post> list=null;
  if(cid == 0){
      list = daoo.getallpost();
  }
  else
  {
      list=daoo.getpostbyid(cid);
  }
  if(list.size()==0)
  {
      out.println("no post this category");
      return ;
  }
     for(Post p: list)
     {
         %>
         <div class="col-md-15">
             <div class="card">
                 <img class="card-img-top" src="postimages/<%= p.getPpic()%> " alt="Card image cap">
                 <div class="card-body" >
                     <b> <%=p.getPtitle()  %> </b> 
                     <p> <%=p.getPcontent()%></p>
                     <Pre> <%=p.getPcode()%></Pre>
                     
                 </div>  
                 
                 
             </div>   
             
         </div>   
         
         
         
         
         
         
      <%   
     }









%>
</div>