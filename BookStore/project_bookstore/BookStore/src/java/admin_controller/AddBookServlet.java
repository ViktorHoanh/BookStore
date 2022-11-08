/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.BookDAO;
import dal.Book_AuthDAO;
import dal.Book_TransDAO;
import dal.PubDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.Publisher;
import model.Type;


public class AddBookServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBookServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookServlet at " + request.getContextPath() + "</h1>");
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
        } else{
            request.getRequestDispatcher("admin/book_add.jsp").forward(request, response);
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
            String bID = request.getParameter("bID");
            String image = request.getParameter("image");
            String title = request.getParameter("title");
            String tID = request.getParameter("tID");
            String aID = request.getParameter("aID");
            String trID = request.getParameter("trID");
            String pID = request.getParameter("pID");
            String no_page = request.getParameter("no_page");
            String pub_date = request.getParameter("pub_date");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            String describe = request.getParameter("describe");
            BookDAO bd = new BookDAO();
            PubDAO pd = new PubDAO();
            TypeDAO td = new TypeDAO();
            Publisher p = pd.getPubById(pID);
            Type t = td.getTypeById(tID);
            Book b = new Book(bID, p, title, Double.parseDouble(price), t, pub_date,
                    Integer.parseInt(no_page), describe, Integer.parseInt(quantity), image);
            bd.insert(b);
            Book_AuthDAO bad = new Book_AuthDAO();
            Book_TransDAO btd = new Book_TransDAO();
            bad.insert(bID, aID);
            if(!trID.equals("0")){
                btd.insert(bID, trID);
            }
            response.sendRedirect("book");
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
