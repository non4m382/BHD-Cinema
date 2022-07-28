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
import java.util.HashMap;
import java.util.List;
import model.Cinema;
import model.Movie;
import model.Transaction;

/**
 *
 * @author Admin
 */
public class TransactionDAO extends DBContext {

    public HashMap<String, Integer> getMoneyByMovies() {
        HashMap<String, Integer> map = new HashMap<>();
        MovieDAO md = new MovieDAO();
        List<Movie> list = md.getAllMovies(1);
        for (Movie m : list) {
            int i = getTotalMoneyByMovie(m.getMovie_id()) * 1000;
            map.put(m.getName(), i);
        }
        return map;
    }

    public HashMap<String, Integer> getMoney() {
        HashMap<String, Integer> map = new HashMap<>();
        CinemaDAO cd = new CinemaDAO();
        List<Cinema> list = cd.getAll();
        for (Cinema c : list) {
            int i = getTotalMoneyByCinema(c.getId()) * 1000;
            map.put(c.getName(), i);
        }
        return map;
    }

    public int getTotalMoneyByCinema(int id) {
        String sql = "select coalesce(sum(price), 0) as total from Booking_details \n"
                + "where DATALENGTH(seat_number) > 0 and booking_id in \n"
                + "(select booking_id from Booking where schedule_id in\n"
                + "(select schedule_id from Schedule where screen_id in \n"
                + "(select screen_id from Screen where cinema_id = ?)))";
        int sum = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sum = rs.getInt("total");
            }
        } catch (SQLException e) {

        }
        return sum;
    }

    public int getTotalMoneyByMovie(int id) {
        String sql = "select coalesce(sum(price), 0) as total from Booking_details \n"
                + "where DATALENGTH(seat_number) > 0 and booking_id in \n"
                + "(select booking_id from Booking where schedule_id in\n"
                + "(select schedule_id from Schedule where movie_id = ?))";
        int sum = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sum = rs.getInt("total");
            }
        } catch (SQLException e) {

        }
        return sum;
    }

    public List<Transaction> getAllTransactionsByUserID(int id) {
        String sql = "select A.booking_detail_id, B.made_time, E.cinema_name, F.name, A.price\n"
                + "from Booking_details A, Booking B, Schedule C, Screen D, Cinema E, Movie F where \n"
                + "A.booking_id = B.booking_id and B.schedule_id = C.schedule_id and C.screen_id = D.screen_id and D.cinema_id = E.cinema_id and C.movie_id = F.movie_id\n"
                + "and A.booking_id in (select booking_id from Booking\n"
                + "where user_id = ?) and DATALENGTH(seat_number) > 0";
        List<Transaction> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Transaction t = new Transaction();
                t.setTransaction_id(rs.getInt("booking_detail_id"));
                t.setMade_time(rs.getString("made_time"));
                t.setCinema_name(rs.getString("cinema_name"));
                t.setMovie_name(rs.getString("name"));
                t.setPrice(rs.getInt("price"));
                list.add(t);
            }
        } catch (SQLException e) {

        }
        return list;
    }
}
