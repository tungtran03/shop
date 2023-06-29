/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Carts;

/**
 *
 * @author tung
 */
public class LoginServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("login.jsp").forward(request, response);

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
        String usernameLogin = request.getParameter("usernameLogin");
        String passwordLogin = request.getParameter("passwordLogin");
        AccountDAO accountDAO = new AccountDAO();
        Account acc = accountDAO.checkLogin(usernameLogin, passwordLogin);
        SanPhamDAO spdao = new SanPhamDAO();
        HttpSession session = request.getSession();

        if (acc != null) {
            String check_raw = acc.getRole();
            int check = Integer.parseInt(check_raw);
            if (check == 4) {
                request.setAttribute("mess", " Tài khoản của bạn đã bị khóa ! Liên hệ quản trị viên để được hỗ trợ :</br>Mail : <a href=\"https://mail.google.com/mail/u/0/#inbox\" target=\"_blank\">trantung.2003k@gmail.com </a>");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                session.setAttribute("account", acc);
                SanPhamDAO sp = new SanPhamDAO();
                List<Carts> carts = sp.getSPByCarts(acc.getId());
                if (carts == null) {
                    session.setAttribute("giohang", null);
                } else {
                    session.setAttribute("giohang", carts);
                }
                response.sendRedirect("auth");
                //session.setMaxInactiveInterval(1800);// sét thời gian tự động xóa session(tự động đăng xuất)
            }

        } else {
            request.setAttribute("mess", "Tài khoản hoặc mật khẩu đã nhập sai!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
