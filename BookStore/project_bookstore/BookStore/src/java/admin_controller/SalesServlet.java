/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.PubDAO;
import dal.SalesDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.Publisher;
import model.Type;


public class SalesServlet extends HttpServlet {

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
            out.println("<title>Servlet SalesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SalesServlet at " + request.getContextPath() + "</h1>");
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
        if(acc==null || acc.getRole()!=1) {
           out.println("access denied!!!!!");
        } else {
            request.getRequestDispatcher("admin/sales.jsp").forward(request, response);
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
        if(acc==null || acc.getRole()!=1) {
           out.println("access denied!!!!!");
        } else {
            String tag = request.getParameter("tag");
            if(tag.equals("0")){
                SalesDAO sd = new SalesDAO();
                request.setAttribute("total_sales", sd.getTotalSales());
                request.setAttribute("highest_day", sd.getHighestSaleDate());
                request.setAttribute("value_order_2", sd.getValueOfOrderByStatus(2));
                request.setAttribute("value_order_3", sd.getValueOfOrderByStatus(3));
                request.setAttribute("value_order_5", sd.getValueOfOrderByStatus(5));
                request.setAttribute("tag", tag);
                request.getRequestDispatcher("admin/sales.jsp").forward(request, response);
            }
            if(tag.equals("1")){
                TypeDAO td = new TypeDAO();
                SalesDAO sd = new SalesDAO();
                List<Type> listT = td.getAllType();
                List<String> listX = new ArrayList<>();
                List<Double> listY = new ArrayList<>();
                for(Type t : listT){
                    listY.add(sd.getSaleByType(t.gettID()));
                    listX.add(t.gettName());
                }
                request.setAttribute("x_value", listX);
                request.setAttribute("y_value", listY);
                request.setAttribute("tag", tag);
                request.getRequestDispatcher("admin/sales.jsp").forward(request, response);
            }
            if(tag.equals("2")){
                SalesDAO sd = new SalesDAO();
                List<Book> listB = sd.getTop8SaleBook();
                List<String> listX = new ArrayList<>();
                List<Double> listY = new ArrayList<>();
                for(Book b:listB){
                    listX.add(b.getTitle());
                    listY.add(sd.getSaleOfBook(b.getbID()));
                }
                
                Book b = sd.getBestSeller();
                request.setAttribute("x_value", listX);
                request.setAttribute("y_value", listY);
                request.setAttribute("tag", tag);
                request.setAttribute("best_seller", b);
                request.setAttribute("most_order", sd.getMostOrderBook());
                request.setAttribute("best_sale", listX.get(0));
                request.getRequestDispatcher("admin/sales.jsp").forward(request, response);
            }
            if(tag.equals("3")){
                SalesDAO sd = new SalesDAO();
                PubDAO pd = new PubDAO();
                List<Publisher> listP = pd.getAllPub();
                List<String> listX = new ArrayList<>();
                List<Double> listY = new ArrayList<>();
                for(Publisher p:listP){
                    listX.add(p.getpName());
                    listY.add(sd.getSalesByPub(p.getpID()));
                }
                request.setAttribute("x_value", listX);
                request.setAttribute("y_value", listY);
                request.setAttribute("tag", tag);
                request.getRequestDispatcher("admin/sales.jsp").forward(request, response);
            }
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
