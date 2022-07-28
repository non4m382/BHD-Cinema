/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingDetails;

/**
 *
 * @author Admin
 */
public class BookingDAO extends DBContext {

    public List<Booking> getAll() {
        String sql = "select * from Booking";
        List<Booking> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBooking_id(rs.getInt("booking_id"));
                b.setUser_id(rs.getInt("user_id"));
                b.setSchedule_id(rs.getInt("schedule_id"));
                b.setMade_time(rs.getString("made_time"));
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<BookingDetails> getAllBookingDetails() {
        String sql = "select * from Booking_details";
        List<BookingDetails> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BookingDetails bd = new BookingDetails();
                bd.setId(rs.getInt("booking_detail_id"));
                bd.setBooking_id(rs.getInt("booking_id"));
                bd.setSeat_number(rs.getString("seat_number"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<BookingDetails> getBookingDetailsByUserID(int id) {
        String sql = "select * from Booking_details where booking_id in \n"
                + "(select booking_id from Booking\n"
                + "where user_id = ?) and DATALENGTH(seat_number) > 0";
        List<BookingDetails> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BookingDetails bd = new BookingDetails();
                bd.setId(rs.getInt("booking_detail_id"));
                bd.setBooking_id(rs.getInt("booking_id"));
                bd.setSeat_number(rs.getString("seat_number"));
                bd.setPrice(rs.getInt("price"));
                list.add(bd);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void insertBooking(int customer_id, int schedule_id, String time) {
        String sql = "insert into Booking output Inserted.booking_id values\n"
                + "(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customer_id);
            st.setInt(2, schedule_id);
            st.setString(3, time);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Integer searchBooking(int customer_id, int schedule_id) {
        String sql = "select top 1 booking_id from Booking\n"
                + "where user_id = ? and schedule_id = ?\n"
                + "order by booking_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customer_id);
            st.setInt(2, schedule_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int i = rs.getInt("booking_id");
                return i;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void insertBookingDetail(int booking_id, String seat_number, double price) {
        String sql = "insert into Booking_details\n"
                + "values(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, booking_id);
            st.setString(2, seat_number);
            st.setDouble(3, price);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        BookingDAO bd = new BookingDAO();
        bd.insertBooking(1, 1050, "2022-10-22");
        List<BookingDetails> list = bd.getBookingDetailsByUserID(1);
        for (BookingDetails i : list) {
            System.out.println(i.getId() + " " + i.getBooking_id() + " " + 
                    i.getSeat_number() + " " + i.getPrice() + "\n");
        }
    }
}
