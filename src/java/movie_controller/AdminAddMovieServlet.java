/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie_controller;

import dal.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Movie;

/**
 *
 * @author Admin
 */
public class AdminAddMovieServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminAddMovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddMovieServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        String img = request.getParameter("img");
        String length_time_raw = request.getParameter("length_time");
        String movie_type = request.getParameter("movie_type");
        String trailer = request.getParameter("trailer");
        String showing_from_date = request.getParameter("showing_from");
        String showing_to_date = request.getParameter("showing_to");
        int length_time;
        try {
            length_time = Integer.parseInt(length_time_raw);
            dal.MovieDAO md = new MovieDAO();
            Movie m = md.getMovieByName(name);
            //co roi
            if (m != null) {
                String ms = name + " existed";
                request.setAttribute("error", ms);
                request.getRequestDispatcher("admin/movie/addmovie.jsp").forward(request, response);
            } else {
                Movie m1 = new Movie();
                m1.setName(name);
                m1.setDescribe(describe);
                m1.setImg(img);
                m1.setLength_time(length_time);
                m1.setMovie_type(movie_type);
                m1.setTrailer(trailer);
                m1.setShowing_from_date(showing_from_date);
                m1.setShowing_to_date(showing_to_date);
                md.insert(m1);
                response.sendRedirect("adminlistmovie");
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
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
