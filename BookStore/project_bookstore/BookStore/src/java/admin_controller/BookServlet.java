/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.BookDAO;
import dal.Book_AuthDAO;
import dal.Book_TransDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Author;
import model.Book;
import model.Translator;


public class BookServlet extends HttpServlet {

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
            out.println("<title>Servlet BookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PrintWriter out = response.getWriter();
        if (acc == null || acc.getRole() != 1) {
            out.println("access denied!!!!!");
        } else {
            BookDAO bd = new BookDAO();
            List<Book> listB = bd.getAllBook();
            int size = listB.size();
            int totalBook=0;
            for(Book b:listB){
                totalBook+=b.getQuantity();
            }
            int NoPage = (size % 7 == 0 ? (size / 7) : (size / 7 + 1));
            int curPage, numPerPage = 7;
            String curPage_raw = request.getParameter("curPage");
            if (curPage_raw == null) {
                curPage = 1;
            } else {
                curPage = Integer.parseInt(curPage_raw);
            }
            int start, end;
            start = (curPage - 1) * numPerPage;
            end = Math.min(curPage * numPerPage, size);
            List<Book> listBPerPage = bd.getListByPage(listB, start, end);

            request.setAttribute("listB", listB);
            request.setAttribute("curPage", curPage);
            request.setAttribute("listPerPage", listBPerPage);
            request.setAttribute("NoPage", NoPage);
            request.setAttribute("size", size);
            request.setAttribute("totalBook", totalBook);
            request.getRequestDispatcher("admin/book.jsp").forward(request, response);
        }
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
