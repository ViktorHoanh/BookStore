/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.AuthorDAO;
import dal.BookDAO;
import dal.Book_AuthDAO;
import dal.Book_TransDAO;
import dal.PubDAO;
import dal.TranslatorDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Author;
import model.Book;
import model.Publisher;
import model.Translator;
import model.Type;


public class AddServlet extends HttpServlet {

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
            out.println("<title>Servlet AddServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServlet at " + request.getContextPath() + "</h1>");
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
            String tag = request.getParameter("tag");
            if (tag.equals("trans")) {
                request.getRequestDispatcher("admin/book_trans_add.jsp").forward(request, response);
            }
            if (tag.equals("type")) {
                request.getRequestDispatcher("admin/book_type_add.jsp").forward(request, response);
            }
            if (tag.equals("publish")) {
                request.getRequestDispatcher("admin/book_publish_add.jsp").forward(request, response);
            }
            if (tag.equals("author")) {
                request.getRequestDispatcher("admin/book_author_add.jsp").forward(request, response);
            }
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PrintWriter out = response.getWriter();
        if (acc == null || acc.getRole() != 1) {
            out.println("access denied!!!!!");
        } else {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String tag = request.getParameter("tag");
            if (tag.equals("type")) {
                TypeDAO td = new TypeDAO();
                td.insert(new Type(Integer.parseInt(id), name));
            }
            if (tag.equals("trans")) {
                TranslatorDAO trd = new TranslatorDAO();
                trd.insert(new Translator(id, name));
            }
            if (tag.equals("publish")) {
                PubDAO pd = new PubDAO();
                pd.insert(new Publisher(id, name));
            }
            if (tag.equals("author")) {
                AuthorDAO ad = new AuthorDAO();
                ad.insert(new Author(id, name));
            }
            response.sendRedirect("action?tag=book&action=3");
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
