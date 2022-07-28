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
import model.Movie;

/**
 *
 * @author Admin
 */
public class MovieDAO extends DBContext {

//    public List<Movie> getAll() {
//        String sql = "select * from Movie";
//        List<Movie> list = new ArrayList<>();
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Movie m = new Movie();
//                m.setMovie_id(rs.getInt("movie_id"));
//                m.setName(rs.getString("name"));
//                m.setDescribe(rs.getString("describe"));
//                m.setImg(rs.getString("img"));
//                m.setLength_time(rs.getInt("length_time"));
//                m.setMovie_type(rs.getString("movie_type"));
//                m.setTrailer(rs.getString("trailer"));
//                m.setShowing_from_date(rs.getString("showing_from_date"));
//                m.setShowing_to_date(rs.getString("showing_to_date"));
//                list.add(m);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//    }

    public List<Movie> getAllMovies(int i) {
        String sql = "select * from Movie \n";
        List<Movie> list = new ArrayList<>();
        String sql1 = "where CAST( GETDATE() AS Date ) > showing_from_date and CAST( GETDATE() AS Date ) < showing_to_date";
        String sql2 = "where CAST( GETDATE() AS Date ) < showing_from_date";
        switch (i) {
            case 0:
                break;
            case 1:
                sql += sql1;
                break;
            default:
                sql += sql2;
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie m = new Movie();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setName(rs.getString("name"));
                m.setDescribe(rs.getString("describe"));
                m.setImg(rs.getString("img"));
                m.setLength_time(rs.getInt("length_time"));
                m.setMovie_type(rs.getString("movie_type"));
                m.setTrailer(rs.getString("trailer"));
                m.setShowing_from_date(rs.getString("showing_from_date"));
                m.setShowing_to_date(rs.getString("showing_to_date"));
                list.add(m);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getMovieCategoryByID(int id) {
        String sql = "select name from Category where category_id \n"
                + "in (select category_id from Movie_category where movie_id = ?)";
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("name"));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void delete(int id) {
        String sql = "delete Movie where movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Movie getMovieByName(String name) {
        String sql = "select * from Movie where name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Movie m = new Movie();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setName(rs.getString("name"));
                m.setDescribe(rs.getString("describe"));
                m.setImg(rs.getString("img"));
                m.setLength_time(rs.getInt("length_time"));
                m.setMovie_type(rs.getString("movie_type"));
                m.setTrailer(rs.getString("trailer"));
                m.setShowing_from_date(rs.getString("showing_from_date"));
                m.setShowing_to_date(rs.getString("showing_to_date"));
                return m;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Movie getMovieByID(int id) {
        String sql = "select * from Movie where movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Movie m = new Movie();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setName(rs.getString("name"));
                m.setDescribe(rs.getString("describe"));
                m.setImg(rs.getString("img"));
                m.setLength_time(rs.getInt("length_time"));
                m.setMovie_type(rs.getString("movie_type"));
                m.setTrailer(rs.getString("trailer"));
                m.setShowing_from_date(rs.getString("showing_from_date"));
                m.setShowing_to_date(rs.getString("showing_to_date"));
                return m;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(Movie m) {
        String sql = "insert into Movie(name, describe, img, length_time, movie_type, trailer, showing_from_date, showing_to_date) values \n"
                + "(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setString(2, m.getDescribe());
            st.setString(3, m.getImg());
            st.setInt(4, m.getLength_time());
            st.setString(5, m.getMovie_type());
            st.setString(6, m.getTrailer());
            st.setString(7, m.getShowing_from_date());
            st.setString(8, m.getShowing_to_date());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Movie m) {
        String sql = "update Movie\n"
                + "set name = ?, describe = ?, \n"
                + "img = '?', length_time = ?, movie_type = ?, \n"
                + "trailer = ?, \n"
                + "showing_from_date = ?, showing_to_date = ?\n"
                + "where movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setString(2, m.getDescribe());
            st.setString(3, m.getImg());
            st.setInt(4, m.getLength_time());
            st.setString(5, m.getMovie_type());
            st.setString(6, m.getTrailer());
            st.setString(7, m.getShowing_from_date());
            st.setString(8, m.getShowing_to_date());
            st.setInt(9, m.getMovie_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        MovieDAO md = new MovieDAO();
        List<Movie> list = md.getAllMovies(0);
        for (Movie m : list) {
            System.out.println(m.getName());
        }
    }
}
