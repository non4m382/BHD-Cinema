/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingDAO;
import dal.CinemaDAO;
import dal.MovieDAO;
import dal.ScheduleDAO;
import dal.ScreenDAO;
import dal.TransactionDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.BookingDetails;
import model.Cinema;
import model.CreateDate;
import model.Movie;
import model.Schedule;
import model.Screen;
import model.Transaction;
import model.User;

/**
 *
 * @author Admin
 */
public class ManageServlet extends HttpServlet {

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
            out.println("<title>Servlet ManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        User acc = (User) session.getAttribute("user");
        if (acc == null || !acc.getRole().equals("admin")) {
            response.sendRedirect("homepage.jsp");
//            response.sendRedirect("manager.jsp");
//            request.getRequestDispatcher("manager.jsp").forward(request, response);
        } else {
        String model = request.getParameter("model");
        if (model != null && model.equals("general")) {
            UserDAO ud = new UserDAO();
            List<User> list = ud.getAllUser();
            request.setAttribute("userss", list.size());

            MovieDAO md = new MovieDAO();
            List<Movie> list1 = md.getAllMovies(0);
            request.setAttribute("movie", list1);

            BookingDAO bd = new BookingDAO();
            List<BookingDetails> list2 = bd.getAllBookingDetails();
            request.setAttribute("booking_detail", list2);

            CinemaDAO cd = new CinemaDAO();
            List<Cinema> list3 = cd.getAll();
            request.setAttribute("cinema", list3);

            request.setAttribute("ok", "ok");
        }
        if (model != null && model.equals("movies")) {
            MovieDAO md = new MovieDAO();
            List<Movie> list = md.getAllMovies(0);
            request.setAttribute("movies", list);
        } else if (model != null && model.equals("cinemas")) {
            CinemaDAO cd = new CinemaDAO();
            List<Cinema> list = cd.getAll();
            request.setAttribute("cinemas", list);
        } else if (model != null && model.equals("screens")) {
            ScreenDAO sd = new ScreenDAO();
            List<Screen> list = sd.getAllScreens();
            request.setAttribute("screens", list);
        } else if (model != null && model.equals("schedules")) {
            ScheduleDAO scd = new ScheduleDAO();
            List<Schedule> list = scd.getAll();
            request.setAttribute("schedules", list);
        } else if (model != null && model.equals("screen_details")) {
            CinemaDAO cd = new CinemaDAO();
            List<Cinema> list = cd.getAll();
            request.setAttribute("cinemas", list);
        }

//        request.getRequestDispatcher("admin/movie/listmovie.jsp").forward(request, response);
        request.getRequestDispatcher("manager.jsp").forward(request, response);
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
