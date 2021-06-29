/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class Userdao {
    private Connection con;

    public Userdao(Connection con) {
        this.con = con;
    }

   //to insert user to database
    public boolean saveUser(User user)
    {
        boolean f= false;
        try{
            String qyery="insert into user(name,email,password,gender,about) value(?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(qyery);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5,user.getAbout());
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    //get user data
    public User getUserByEmailandPassword(String email,String password) {
       User user=null;
       try{
           String query="select * from user where email=? and password=?";
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1, email);
             ps.setString(2, password);
             ResultSet set=ps.executeQuery();
             if(set.next())
             {
                 user=new User();
                 String name=set.getString("name");
                 user.setName(name);
                 user.setId(set.getInt("id"));
                 user.setEmail(set.getString("email"));
                 user.setPassword(set.getString("password"));
                 user.setGender(set.getString("Gender"));
                 user.setAbout(set.getString("about"));
                 user.setDatatime(set.getTimestamp("rdate"));
                 user.setProfile(set.getString("profile"));
                 
                 
             }
       }
       catch(Exception e)
       {
            e.printStackTrace();
       }
       return user;
    }
    
    
    public boolean updateUser(User user)
    {  boolean f=false;
        try{
            String query="update user set name=?,email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
             ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5,user.getAbout());
            
                ps.setString(6,user.getProfile());
           // ps.setString(6,user.getProfile());
              ps.setInt(7,user.getId());
              ps.executeUpdate();
               f=true;
            
            
            
        }
        catch(Exception e)
        {
            
        }
        return f;
    }
    
}
