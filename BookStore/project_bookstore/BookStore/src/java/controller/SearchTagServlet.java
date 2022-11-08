/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookDAO;
import dal.PubDAO;
import dal.TypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;


public class SearchTagServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchTagServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchTagServlet at " + request.getContextPath() + "</h1>");
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
        String tag = request.getParameter("tag");
        String id_raw = request.getParameter("id");
        int id;
        String name = "";
        BookDAO bd = new BookDAO();
        TypeDAO td = new TypeDAO();
        PubDAO pd = new PubDAO();
        List<Book> listB = new ArrayList<>();
        switch (tag) {
            case "type":
                id = Integer.parseInt(id_raw);
                name = td.getTypeById(id_raw).gettName();
                listB = bd.getBookByType(id);
                break;
            case "pub":
                listB = bd.getBookByPub(id_raw);
                name = "NXB " + pd.getPubById(id_raw).getpName();
                break;
            case "sell":
                listB = bd.getBestSeller();
                name = "Sách bán chạy";
                break;
            case "new":
                listB = bd.getNewBook();
                name = "Sách mới";
                break;
            default:
                break;
        }

        int size = listB.size();
        int NoPage = (size % 8 == 0 ? (size / 8) : (size / 8 + 1));
        int curPage, numPerPage = 8;
        String curPage_raw = request.getParameter("curPage");
        if (curPage_raw == null) {
            curPage = 1;
        } else {
            curPage = Integer.parseInt(curPage_raw);
        }
        int start, end;
        start = (curPage - 1) * numPerPage;
        end = Math.min(curPage * numPerPage, size);
        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "normal";
        }
        bd.sortBookByPrice(listB, sort);
        List<Book> listBPerPage = bd.getListByPage(listB, start, end);

        request.setAttribute("listB", listB);
        request.setAttribute("curPage", curPage);
        request.setAttribute("listPerPage", listBPerPage);
        request.setAttribute("NoPage", NoPage);
        request.setAttribute("name", name);
        request.setAttribute("sort", sort);

        request.setAttribute("tag", tag);
        request.setAttribute("id", id_raw);
        request.getRequestDispatcher("/page/search_tag.jsp").forward(request, response);
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
