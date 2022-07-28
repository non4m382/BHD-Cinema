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
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public List<User> getAllUser() {
        String sql = "select * from Users";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setFirst_name(rs.getString("first_name"));
                u.setLast_name(rs.getString("last_name"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setBirthday(rs.getString("birthday"));
                u.setMail(rs.getString("mail"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserByID(int id) {
        String sql = "select * from Users where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setFirst_name(rs.getString("first_name"));
                u.setLast_name(rs.getString("last_name"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setBirthday(rs.getString("birthday"));
                u.setMail(rs.getString("mail"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User check(String user, String pass) {
        String sql = "select * from Users where mail = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("birthday"),
                        rs.getString("mail"),
                        rs.getString("role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(User u) {
        String sql = "insert into Users values\n"
                + "(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFirst_name());
            st.setString(2, u.getLast_name());
            st.setString(3, u.getPassword());
            st.setString(4, u.getPhone());
            st.setString(5, u.getBirthday());
            st.setString(6, u.getMail());
            st.setString(7, u.getRole());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        List<User> list = ud.getAllUser();
        User u = ud.check("nguyenduc20115@gmail.com", "123");
        System.out.println(u.getRole());
    }
}
