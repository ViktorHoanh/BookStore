/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.Item;
import model.Order;


public class BuyServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
        if (acc == null) {
            out.println("You must login before use this function!!!");
        } else {
            String action = request.getParameter("action");
            String bID = request.getParameter("bID");
            String quantity_raw = request.getParameter("quantity");
            int quantity;
            if(quantity_raw == null){
                quantity = 1;
            } else {
                quantity = Integer.parseInt(quantity_raw);
                if(quantity<0) quantity = 1;
            }
            OrderDAO od = new OrderDAO();
            BookDAO bd = new BookDAO();
            if (action.equals("now")) {
                Book b = bd.getBookByID(bID);
                Item i = new Item(b, quantity);
                List<Item> listI = new ArrayList<>();
                listI.add(i);
                session.setAttribute("listI_now", listI);
                request.getRequestDispatcher("page/buy_now.jsp").forward(request, response);
            }
            if(action.equals("cart")){
                String link = (String) session.getAttribute("pre_url");
                Book b = bd.getBookByID(bID);
                Item i = new Item(b, quantity);
                List<Item> listI =(List<Item>) session.getAttribute("listI");
                if(listI == null){
                    listI = new ArrayList<>();
                    listI.add(i);
                } else {
                    Item inCart = getItemInCart(listI, b);
                    if(inCart != null){
                        inCart.setQuantity(inCart.getQuantity()+quantity);
                    } else {
                        listI.add(i);
                    }
                }
                session.setAttribute("listI", listI);
                session.setAttribute("NoItem", listI.size());
                session.removeAttribute("pre_url");
                response.sendRedirect("book_detail?bID="+bID);
            }
        }
    }
    public Item getItemInCart(List<Item> listI, Book b){
        for(Item i: listI){
            if(i.getB().getbID().equals(b.getbID())) return i;
        }
        return null;
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
        if (acc == null) {
            out.println("You must login before use this function!!!");
        } else {
            String action = request.getParameter("action");
            String cusName = request.getParameter("cusName");
            String cusPhone = request.getParameter("cusPhone");
            String cusEmail = request.getParameter("cusEmail");
            String cusAddr = request.getParameter("cusAddr");
            String shID = request.getParameter("shID");
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String curDate = sdf.format(date);
            OrderDAO od = new OrderDAO();
            Order order = new Order(od.getLastOrderID()+1, acc, od.getShipByID(shID), curDate,
                    cusName, cusPhone, cusAddr, cusEmail);
            if(action.equals("now")){
                List<Item> listI_now = (List<Item>) session.getAttribute("listI_now");
                od.insertOrderAndRelated(order, listI_now);
                session.removeAttribute("listI_now");
            } 
            if(action.equals("cart")){
                List<Item> listI = (List<Item>) session.getAttribute("listI");
                od.insertOrderAndRelated(order, listI);
                session.removeAttribute("listI");
                session.removeAttribute("NoItem");
            } 
            response.sendRedirect("home");
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
