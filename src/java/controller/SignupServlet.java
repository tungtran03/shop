/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 *@author tung
 */
public class SignupServlet extends HttpServlet {

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
         HttpSession session = request.getSession();
         String user= request.getParameter("user");
        String email= request.getParameter("email");
        String hoten= request.getParameter("fullname");     
        String pass= request.getParameter("pass");
        String re_pass= request.getParameter("repass");       
        String noti ="";
        
        if(pass.length() < 4){
            noti ="Mật khẩu quá ngắn!";
               session.setAttribute("mess",noti);
        response.sendRedirect("signup.jsp");
        }else{
         if(!pass.equals(re_pass)){
            noti ="Mật khẩu không trùng nhau!";
              session.setAttribute("mess",noti);
        response.sendRedirect("signup.jsp");
        }else{
            AccountDAO acdao= new AccountDAO();
            Account a = acdao.checkAccountExist(user);
            if(a==null){
                if(acdao.signup(user, pass, hoten, noti, noti, email, noti, "3", "0")){                  
                    noti ="Đăng kí thành công, vui lòng đăng nhập lại !";
                    
                }
                else{
                    noti ="wwww";
                }
                
            }else{
                noti ="User hoặc email đã tồn tại!";
            }
        }
           session.setAttribute("mess",noti);
        response.sendRedirect("login.jsp");
        }   
      
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