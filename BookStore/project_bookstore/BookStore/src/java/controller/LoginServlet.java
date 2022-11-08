/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;


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
        try (PrintWriter out = response.getWriter()) {
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("top_nav/dangnhap.jsp").forward(request, response);
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
        String user_raw = request.getParameter("user");
        String pass_raw = request.getParameter("pass");
        String remember = request.getParameter("remember");
        Cookie user = new Cookie("username", user_raw);
        Cookie pass = new Cookie("password", pass_raw);
        HttpSession session = request.getSession();
        session.setAttribute("login_err", "Tài khoản hoặc mật khẩu không chính xác");
        int rem;
        try {
            rem = Integer.parseInt(remember);

            if (rem == 1) {
                user.setMaxAge(24 * 60 * 60); // cookie alive for 24 hours
                pass.setMaxAge(24 * 60 * 60); // cookie alive for 24 hours
                response.addCookie(user);
                response.addCookie(pass);
            } else {
                user.setMaxAge(0); // delete cookie
                pass.setMaxAge(0); // delete cookie
                response.addCookie(user);
                response.addCookie(pass);
            }
        } catch (NumberFormatException e) {
        }
        AccountDAO ad = new AccountDAO();
        if (ad.isAccountExist(user_raw, pass_raw)) {
            session.removeAttribute("login_err");
            session.setAttribute("acc", ad.getAccByUsername(user_raw));
            response.sendRedirect("home");
        } else {
//            request.setAttribute("login_err", "Tài khoản hoặc mật khẩu không chính xác");
            response.sendRedirect("login");
//            request.getRequestDispatcher("top_nav/dangnhap.jsp").forward(request, response);
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
