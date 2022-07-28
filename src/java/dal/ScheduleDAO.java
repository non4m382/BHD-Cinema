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
import java.util.LinkedHashMap;
import java.util.List;
import model.Cinema;
import model.Movie;
import model.Schedule;
import model.Screen;
import model.ShowingHour2;
import model.Showing_Hour;

/**
 *
 * @author Admin
 */
public class ScheduleDAO extends DBContext {

    public List<Schedule> getAll() {
        String sql = "select * from Schedule";
        List<Schedule> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));
                s.setScreen_id(rs.getInt("screen_id"));
                s.setMovie_id(rs.getInt("movie_id"));
                s.setShowing_date(rs.getString("showing_date"));
                s.setStart_time(rs.getString("start_time"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Schedule getScheduleByID(int id) {
        String sql = "select * from Schedule where schedule_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));
                s.setScreen_id(rs.getInt("screen_id"));
                s.setMovie_id(rs.getInt("movie_id"));
                s.setShowing_date(rs.getString("showing_date"));
                s.setStart_time(rs.getString("start_time"));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Schedule> getScheduleByDateScreen(int screen_id, String date) {
        String sql = "select * from Schedule\n"
                + "where showing_date like ? and screen_id = ?";
        List<Schedule> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, screen_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getInt("schedule_id"));
                s.setScreen_id(rs.getInt("screen_id"));
                s.setMovie_id(rs.getInt("movie_id"));
                s.setShowing_date(rs.getString("showing_date"));
                s.setStart_time(rs.getString("start_time"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Showing_Hour> getShowing_HourByDate(String date, int movie_id) {
        String sql = "select distinct cinema_id, S.screen_id from Schedule S, Screen C\n"
                + "where showing_date like ? and S.screen_id = C.screen_id and movie_id = ?";
        List<Showing_Hour> hour_list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, movie_id);
            ResultSet rs = st.executeQuery();
            CinemaDAO cd = new CinemaDAO();
            ScreenDAO sd = new ScreenDAO();
            ScheduleDAO schd = new ScheduleDAO();
            while (rs.next()) {
                Cinema c = cd.getCinemaByCinemaID(rs.getInt("cinema_id"));
                Screen s = sd.getScreenByID(rs.getInt("screen_id"));
                List<Schedule> sl = schd.getScheduleByDateScreen(rs.getInt("screen_id"), date);
                hour_list.add(new Showing_Hour(c, s, sl));
            }
            return hour_list;
        } catch (SQLException e) {

        }
        return null;
    }

    public List<ShowingHour2> getShowingHourByDateCinemaID(String date, int cinema_id) {
        String sql = "select distinct screen_id, movie_id from Schedule where screen_id in (select screen_id from Screen \n"
                + "										where cinema_id = ?)\n"
                + "and showing_date like ?";
        List<ShowingHour2> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cinema_id);
            st.setString(2, date);
            ResultSet rs = st.executeQuery();
            MovieDAO md = new MovieDAO();
            ScreenDAO sd = new ScreenDAO();
            ScheduleDAO schd = new ScheduleDAO();
            while (rs.next()) {
                Movie m = md.getMovieByID(rs.getInt("movie_id"));
                Screen s = sd.getScreenByID(rs.getInt("screen_id"));
                List<Schedule> sl = schd.getScheduleByDateScreen(rs.getInt("screen_id"), date);
                list.add(new ShowingHour2(s, m, sl));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<String> getAllSeatsByScheduleID(int id) {
        String sql = "select * from Booking_details \n"
                + "where booking_id in (select booking_id from Booking\n"
                + "					where schedule_id = ?)";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("seat_number"));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public LinkedHashMap<Integer, Integer> getScreenMovieByCinemaDate(String date, int cinemaid) {
        String sql = "select distinct screen_id, movie_id from Schedule where screen_id in (select screen_id from Screen \n"
                + "										where cinema_id = ?)\n"
                + "and showing_date like ?";
        LinkedHashMap<Integer, Integer> map = new LinkedHashMap<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cinemaid);
            st.setString(2, date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int screenid = rs.getInt("screen_id");
                int movieid = rs.getInt("movie_id");
                map.put(screenid, movieid);
            }
        } catch (SQLException e) {

        }
        return map;
    }

    public static void main(String[] args) {
        ScheduleDAO sd = new ScheduleDAO();
//        List<Schedule> list = sd.getScheduleByDate(1, "2022-03-10");
//        List<Schedule> list2 = sd.getScheduleByDate2("HOUSE OF GUCCI", "2022-03-10");
//        List<Schedule> list3 = sd.getScheduleByDateScreen(1, "2022-03-10");
//        for (Schedule s : list3) {
//            System.out.println(s.getSchedule_id() + "\t" + s.getScreen_id() + "\t" + s.getStart_time());
//        }
//        List<Showing_Hour> list4 = sd.getShowing_HourByDate("2022-03-10");
//        for (Showing_Hour sh : list4) {
//            System.out.println(sh.getCinema().getName() + "\t" + sh.getCinema().getAddress());
//            System.out.println("Screen: " + sh.getScreen().getScreen_number());
//            for (Schedule s : sh.getSchedule_list()) {
//                System.out.println("- " + s.getStart_time());
//            }
//        }
    }
}
