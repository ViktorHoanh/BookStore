/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.BookDAO;
import dal.Book_AuthDAO;
import dal.Book_TransDAO;
import dal.OrderDAO;
import dal.TypeDAO;
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
import model.Order;
import model.OrderLine;
import model.Order_Status;
import model.Translator;


public class ActionServlet extends HttpServlet {

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
            out.println("<title>Servlet ActionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActionServlet at " + request.getContextPath() + "</h1>");
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
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            if (tag.equals("book")) {
                BookDAO bd = new BookDAO();
                Book_AuthDAO bad = new Book_AuthDAO();
                Book_TransDAO btd = new Book_TransDAO();
                Book b = bd.getBookByID(id);
                List<Translator> listTr = btd.getTransOfBook(id);
                List<Author> listA = bad.getAuthorsOfBook(id);
                request.setAttribute("book", b);
                request.setAttribute("listA", listA);
                request.setAttribute("listTr", listTr);
                if (action.equals("1")) {
                    request.getRequestDispatcher("admin/book_details.jsp").forward(request, response);
                }
                if (action.equals("2")) {
                    request.getRequestDispatcher("admin/book_update.jsp").forward(request, response);
                }
                if (action.equals("3")) {
                    response.sendRedirect("add_book");
                }
            }
            if(tag.equals("order")){
                OrderDAO od = new OrderDAO();              
                Order o = od.getOrderByID(id);
                List<OrderLine> listOL = od.getAllOrderLines(id);
                List<Order_Status> listOS = od.getAllOrStatus(id);
                request.setAttribute("order", o);
                request.setAttribute("listOL", listOL);
                request.setAttribute("listOS", listOS);
                if(action.equals("1")){
                    request.getRequestDispatcher("admin/order_details.jsp").forward(request, response);
                }
                if(action.equals("2")){
                    Order_Status currentOS = listOS.get(0);
                    request.setAttribute("currentOS", currentOS);
                    request.getRequestDispatcher("admin/order_update.jsp").forward(request, response);
                }
            }
            if(tag.equals("type")){
                TypeDAO td = new TypeDAO();
                int size = td.getAllType().size();
                request.setAttribute("size", size);
                if (action.equals("1")) {
                    request.getRequestDispatcher("admin/type_add.jsp").forward(request, response);
                }
            }
            if(tag.equals("pub")){
                
                if(action.equals("1")){
                    request.getRequestDispatcher("admin/publisher_add.jsp").forward(request, response);
                }
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
