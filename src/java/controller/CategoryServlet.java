/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;
import model.Category;
import model.SanPham;

/**
 *
 * @author tung
 */
@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

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
         String cateID = request.getParameter("id");
         int id;

        if(cateID == null||cateID==""){
            id=5;
        }else{
            id=Integer.parseInt(cateID);
        }
       // CategoryDAO categoryDAO = new CategoryDAO();
       // List<Category> listCategory = categoryDAO.getALL();
        SanPhamDAO sanphamDAO = new SanPhamDAO();
        List<SanPham> listSanPham1; 
          if (id == 5) {
            listSanPham1 = sanphamDAO.getALL();
        } else {
            listSanPham1 = sanphamDAO.getSanPhamByCid(id);
        }
        int page,numberpage = 4;
        int size = listSanPham1.size();
        int num = (size%4==0?(size/4):((size/4))+1);//số trang
        String xpage = request.getParameter("page");
        if(xpage == null){
            page = 1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start,end;
        start = (page-1)*numberpage;
        end = Math.min(page*numberpage,size);
        List<SanPham> listSanPham = sanphamDAO.getPage(listSanPham1, start, end);
        
        HttpSession session = request.getSession();
      
      //  session.setAttribute("listCategory", listCategory);
        session.setAttribute("page", page);
         session.setAttribute("num", num);
         session.setAttribute("listSanPham", listSanPham);
         session.setAttribute("id", id);
         
          CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listCategory = categoryDAO.getALL();
        session.setAttribute("listCategory", listCategory);
        //request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
