/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client;

import dal.SanPhamDAO;
import dal.WebDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import model.SanPham;

/**
 *
 * @author tung
 */
public class CheckoutServlet extends HttpServlet {
     static HashMap<SanPham, Integer> out = new HashMap<>();
    

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
      out.clear();
        String value = request.getParameter("order");
        String[] l1 = value.split("tdz");
        String[] l2 = null;
        for (String string : l1) {
            if ("".equals(string) || string == null) {

            } else {
                l2 = string.split("thdzvkl");
                if (Integer.parseInt(l2[0]) == 0 || Integer.parseInt(l2[1]) == 0) {

                } //dacat
                else {

                    SanPhamDAO sanphamdao = new SanPhamDAO();
                    SanPham sp = sanphamdao.getSPByID(Integer.parseInt(l2[0]));
                    out.put(sp, Integer.valueOf(l2[1]));
                }
            }
        }
        request.setAttribute("code", out);
        WebDAO wdao = new WebDAO();
//        listdiscode = wdao.getAllDis();
//        request.setAttribute("discountcode", wdao.getAllDis());
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
