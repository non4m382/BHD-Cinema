/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import model.Cinema;

/**
 *
 * @author Admin
 */
public class CinemaDAO extends DBContext {

    public List<Cinema> getAll() {
        String sql = "select * from Cinema";
        List<Cinema> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cinema c = new Cinema();
                c.setId(rs.getInt("cinema_id"));
                c.setName(rs.getString("cinema_name"));
                c.setAddress(rs.getString("cinema_address"));
                c.setPhone(rs.getString("phone"));
                c.setMail(rs.getString("mail"));
                c.setExtra_price(rs.getInt("extra_price_id"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Cinema getCinemaByCinemaID(int cinema_id) {
        String sql = "select * from Cinema where cinema_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cinema_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cinema c = new Cinema();
                c.setId(rs.getInt("cinema_id"));
                c.setName(rs.getString("cinema_name"));
                c.setAddress(rs.getString("cinema_address"));
                c.setPhone(rs.getString("phone"));
                c.setMail(rs.getString("mail"));
                c.setExtra_price(rs.getInt("extra_price_id"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getCinemaImg(int id) {
        String sql = "select * from Cinema_img where cinema_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                return img;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<String> getAllCities() {
        CinemaDAO cd = new CinemaDAO();
        List<Cinema> list = cd.getAll();
        List<String> cities = new ArrayList<>();
        for (Cinema i : list) {
            String[] str = i.getAddress().split(",");
            String city = str[str.length - 1].trim();
            if (!cities.contains(city)) {
                cities.add(city);
            }
        }
        return cities;
    }

    public LinkedHashMap<String, List<Cinema>> getAllCinemasByCities() {
        LinkedHashMap<String, List<Cinema>> map = new LinkedHashMap<>();
        CinemaDAO cd = new CinemaDAO();
        List<String> cities = cd.getAllCities();
        for (String j : cities) {
            List<Cinema> cilist = cd.getAllCinemasByCity(j);
            map.put(j, cilist);
        }
        return map;
    }

    public List<Cinema> getAllCinemasByCity(String city) {
        String sql = "select * from Cinema\n"
                + "where cinema_address like ?";
        List<Cinema> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + city);
//            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cinema c = new Cinema();
                c.setId(rs.getInt("cinema_id"));
                c.setName(rs.getString("cinema_name"));
                c.setAddress(rs.getString("cinema_address"));
                c.setPhone(rs.getString("phone"));
                c.setMail(rs.getString("mail"));
                c.setExtra_price(rs.getInt("extra_price_id"));
                list.add(c);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        CinemaDAO cd = new CinemaDAO();
//        Cinema c = cd.getCinemaByCinemaID(1);
//        System.out.println(c.getName());
//        List<Cinema> list = cd.getAll();
//        List<String> cities = new ArrayList<>();
//        HashMap<String, List<String>> map = new HashMap<>();
//        for (Cinema i : list) {
//            String[] str = i.getAddress().split(",");
//            String city = str[str.length - 1].trim();
//            if (!cities.contains(city)) {
//                cities.add(city);
//            }
//            System.out.println(i.getAddress());
//        }
//
//        cities.forEach((t) -> {
//            System.out.println(t);
//        });

//        String a = cd.getCinemaImg("1");
//        System.out.println(a);
//        List<Cinema> list = cd.getAllCinemasByCity("Hà Nội");
//        list.forEach((t) -> {
//            System.out.println(t.getAddress());
//        });
        LinkedHashMap<String, List<Cinema>> map = cd.getAllCinemasByCities();
        for (String s : map.keySet()) {
            System.out.println(s);
            for (Cinema c : map.get(s)) {
                System.out.println("- " + c.getName() + c.getAddress());
            }
        }
    }
}
