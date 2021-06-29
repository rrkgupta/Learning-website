/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;

/**
 *
 * @author Administrator
 */
import java.util.ArrayList;
import java.util.List;
public class Postdao {
    Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllcategory()
    {
        ArrayList<Category> list=new ArrayList<>();
        try{
            
            
            
            String q="select * from category";
            Statement st= this.con.createStatement();
            ResultSet rs=st.executeQuery(q);
            while(rs.next())
            {
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
               
            Category c=new Category(cid, name, description);
            list.add(c);
                    }
            
        }
        catch(Exception e){
            
            
        }
        return list;
        
    }
   public boolean saveposts(Post p)
    {
        boolean f= false;
        try{
            String qyery="insert into post(ptitle,pcontent,pcode,ppic,catid,userid) value(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qyery);
            ps.setString(1,p.getPtitle());
            ps.setString(2,p.getPcontent());
            ps.setString(3,p.getPcode());
            ps.setString(4,p.getPpic());
            ps.setInt(5,p.getCatid());
            ps.setInt(6,p.getUserid());
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
                }
   public List<Post> getallpost()
   {
     List<Post> list=new ArrayList<>();
     //fetch data
     try{
         PreparedStatement ps=con.prepareStatement("select * from post order by pid desc");
         ResultSet rs=ps.executeQuery();
         while (rs.next()) {
             int pid=rs.getInt("pid");
             String ptitle=rs.getString("ptitle");
            
             String pcontent=rs.getString("pcontent");
             String pcode=rs.getString("pcode");
             String ppic=rs.getString("ppic");
             Timestamp date=rs.getTimestamp("pdate");
             int catid=rs.getInt("catid");
             int userid=rs.getInt("userid");
             Post p=new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
             list.add(p);
             
             
           
             
         }
         
         
         
     }
     catch(Exception e)
     {
         e.printStackTrace();
     }
     
     return list;
       
       
   }
   public List<Post> getpostbyid(int catid)
   {
       
      List<Post> list=new ArrayList<>();
     try{
         PreparedStatement ps=con.prepareStatement("select * from post where catid=?");
         ps.setInt(1, catid);
         ResultSet rs=ps.executeQuery();
         while (rs.next()) {
             int pid=rs.getInt("pid");
             String ptitle=rs.getString("ptitle");
            
             String pcontent=rs.getString("pcontent");
             String pcode=rs.getString("pcode");
             String ppic=rs.getString("ppic");
             Timestamp date=rs.getTimestamp("pdate");
             int catId=rs.getInt("catid");
             int userid=rs.getInt("userid");
             Post p=new Post(pid,ptitle,pcontent,pcode,ppic,date,catId,userid);
             list.add(p);
             
             
           
             
         }
         
         
         
     }
     catch(Exception e)
     {
         e.printStackTrace();
     }
     
     
     return list;  
       
   }
    
    
    
}
