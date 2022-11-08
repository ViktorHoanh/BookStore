/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dal.BookDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.Order_Status;


public class UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PrintWriter out = response.getWriter();
        if (acc == null || acc.getRole() != 1) {
            out.println("access denied!!!!!");
        } else {
            BookDAO bd = new BookDAO();
            String tag = request.getParameter("tag");
            if (tag.equals("book")) {
                String id = request.getParameter("id");
                String image = request.getParameter("image");
                String title = request.getParameter("title");
                String no_page = request.getParameter("no_page");
                String pub_date = request.getParameter("pub_date");
                String quantity = request.getParameter("quantity");
                String price = request.getParameter("price");
                String describe = request.getParameter("describe");

                try {
                    Book b = bd.getBookByID(id);
                    b.setImage(image);
                    b.setTitle(title);
                    b.setNoPage(Integer.parseInt(no_page));
                    b.setPubDate(pub_date);
                    b.setQuantity(Integer.parseInt(quantity));
                    b.setPrice(Double.parseDouble(price));
                    b.setDescrip(describe);
                    bd.update(b);
                    response.sendRedirect("book");
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }              
            }
            if(tag.equals("order")){
                String link = (String) session.getAttribute("pre_url");
                String oID = request.getParameter("oID");
                String sID = request.getParameter("sID");
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String curDate = sdf.format(date);
                OrderDAO od = new OrderDAO();
                Order_Status os = new Order_Status(od.getOrderByID(oID),
                        curDate, od.getStatusByID(sID));
                od.insertOrderStatus(os);
                session.removeAttribute("pre_url");
                response.sendRedirect(link);
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
