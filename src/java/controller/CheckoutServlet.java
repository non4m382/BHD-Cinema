/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingDAO;
import dal.PriceDAO;
import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Schedule;
import model.User;

/**
 *
 * @author Admin
 */
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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

        PrintWriter out = response.getWriter();
        String a = request.getParameter("cdf");
        //get seats
        String[] seats = a.split("-");
        for (int i = 0; i < seats.length; i++) {
//            out.
            if (seats[i].length() == 0) {
                out.println("empty");
            } else {
                out.println(seats[i]);
            }
        }

        //get user
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        out.println(user.getMail() + " " + user.getRole() + " " + user.getPhone());

        //get schedule
        String schedule_id_raw = request.getParameter("schedule_id");
        int schedule_id = 0;
        try {
            schedule_id = Integer.parseInt(schedule_id_raw);
        } catch (NumberFormatException e) {
        }
        ScheduleDAO sd = new ScheduleDAO();
        Schedule s = sd.getScheduleByID(schedule_id);
        out.println(schedule_id);

        //get price
        PriceDAO pd = new PriceDAO();
        int price = pd.checkPrice(s);
        out.println(price);

        //get now time
        Date d = new Date();
        String made_date = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(d);

        BookingDAO bd = new BookingDAO();
        bd.insertBooking(user.getUser_id(), schedule_id, made_date);
        int booking_id = bd.searchBooking(user.getUser_id(), schedule_id);
        for (int i = 0; i < seats.length; i++) {
            if (seats[i].length() != 0) {
                bd.insertBookingDetail(booking_id, seats[i], price);
            }
        }
//
        response.sendRedirect("listmovie");
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
