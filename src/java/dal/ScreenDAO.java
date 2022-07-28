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
import model.Screen;
import model.Screen_detail;

/**
 *
 * @author Admin
 */
public class ScreenDAO extends DBContext {

    public List<Screen> getAllScreens() {
        String sql = "select * from Screen";
        List<Screen> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Screen s = new Screen();
                s.setScreen_id(rs.getInt("screen_id"));
                s.setCinema_id(rs.getInt("cinema_id"));
                s.setScreen_number(rs.getInt("screen_number"));
                s.setScreen_type(rs.getString("screen_type"));
                s.setScreen_detail_id(rs.getInt("screen_detail_id"));
                list.add(s);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Screen getScreenByID(int id) {
        String sql = "select * from Screen where screen_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Screen s = new Screen();
                s.setScreen_id(rs.getInt("screen_id"));
                s.setCinema_id(rs.getInt("cinema_id"));
                s.setScreen_number(rs.getInt("screen_number"));
                s.setScreen_type(rs.getString("screen_type"));
                s.setScreen_detail_id(rs.getInt("screen_detail_id"));
                return s;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Screen_detail getScreenDetailByID(int id) {
        String sql = "select * from Screen_detail where screen_detail_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Screen_detail s_d = new Screen_detail();
                s_d.setId(rs.getInt("screen_detail_id"));
                s_d.setRows(rs.getInt("number_of_rows"));
                s_d.setSeats(rs.getInt("number_of_seats"));
                s_d.setDetail(rs.getString("detail"));
                return s_d;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<String> getAlphabetRows(int rows) {
        List<String> list = new ArrayList<>();
        for (int i = 1; i <= rows; i++) {
            char ch = (char) (i + 64);
            String s = "" + ch;
            list.add(s);
        }
        return list;
    }

    public static void main(String[] args) {
        ScreenDAO sd = new ScreenDAO();
        List<String> list = sd.getAlphabetRows(7);
        System.out.println(list.toString());
    }
}
