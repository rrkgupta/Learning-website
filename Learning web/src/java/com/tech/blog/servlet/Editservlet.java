/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.Userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
@WebServlet("/FileUploadServlet")
@MultipartConfig


public class Editservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Editservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //create path
            String SAVE_DIR="images";
              String savePath = "D:"+File.separator+"Learn"+File.separator+"web" + File.separator + SAVE_DIR;
               Helper.savefile(savePath);
           String name=request.getParameter("name");
          
            String email=request.getParameter("email");
           
             String about=request.getParameter("about");
              Part part=request.getPart("file");
            String fileName=Helper.extractFileName(part);
             part.write(savePath + File.separator + fileName);
              String filePath= savePath + File.separator + fileName ;
             //get the user from session
             HttpSession s= request.getSession();
             User user=(User)s.getAttribute("currentUser");
             user.setEmail(email);
              user.setName(name);
              user.setAbout(about);
              String oldfile=user.getProfile();
              user.setProfile(fileName);
              //
             String patholdfile=savePath + File.separator + oldfile;
             //if(!oldfile.equals("default.png"))
             //Helper.deletefile( patholdfile);
             
              Userdao dao = new Userdao(ConnectionProvider.getConnection());
               if (dao. updateUser(user)) {
                 
                  Message msg=new Message("profile details  update","success","alert-success");
                
         s.setAttribute("msg",msg);
             

               
                 
                    
                } else {
                 
                    Message msg=new Message("something went wrong","error","alert-danger");
          s.setAttribute("msg",msg);
             

                }
               response.sendRedirect("Profile.jsp");
             
           
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
