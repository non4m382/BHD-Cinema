/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CinemaDAO;
import dal.MovieDAO;
import dal.PriceDAO;
import dal.ScheduleDAO;
import dal.ScreenDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cinema;
import model.Movie;
import model.Schedule;
import model.Screen;
import model.Screen_detail;
import model.User;

/**
 *
 * @author Admin
 */
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
        HttpSession session = request.getSession(true);
        User acc = (User) session.getAttribute("user");
        if (acc == null) {
            request.setAttribute("noti", "You need to login to buy tickets");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {

            String schedule_id_raw = request.getParameter("schedule");
            String cinema_id_raw = request.getParameter("cinema");

            int cinema_id = 0, schedule_id = 0;
            try {
                cinema_id = Integer.parseInt(cinema_id_raw);
                schedule_id = Integer.parseInt(schedule_id_raw);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }

            CinemaDAO cd = new CinemaDAO();
            ScheduleDAO sched = new ScheduleDAO();
            ScreenDAO sd = new ScreenDAO();
            MovieDAO md = new MovieDAO();
            PriceDAO pd = new PriceDAO();

            Schedule schedule = sched.getScheduleByID(schedule_id);
            Cinema cinema = cd.getCinemaByCinemaID(cinema_id);
            Screen screen = sd.getScreenByID(schedule.getScreen_id());
            Movie movie = md.getMovieByID(schedule.getMovie_id());

            Screen_detail s_d = sd.getScreenDetailByID(screen.getScreen_detail_id());
            int price = pd.checkPrice(schedule);

            List<String> list = sd.getAlphabetRows(s_d.getRows());
            List<String> seatsList = sched.getAllSeatsByScheduleID(schedule_id);

            request.setAttribute("price", price);
            request.setAttribute("schedule", schedule);
            request.setAttribute("cinema", cinema);
            request.setAttribute("screen", screen);
            request.setAttribute("movie", movie);
            request.setAttribute("screenDetail", s_d);
            request.setAttribute("rows_alphabet", list);
            request.setAttribute("seatsList", seatsList);

            request.getRequestDispatcher("buy.jsp").forward(request, response);
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
