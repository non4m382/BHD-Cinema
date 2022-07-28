/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import model.Price;
import model.Schedule;

/**
 *
 * @author Admin
 */
public class PriceDAO extends DBContext {

    public List<Price> getAll() {
        String sql = "select * from Price";
        List<Price> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Price p = new Price();
                p.setId(rs.getInt("price_id"));
                p.setCustomer_type(rs.getString("customer_type"));
                p.setMon(rs.getInt("monday"));
                p.setTuesWedThurBefore11(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurBefore17(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurAfter17(rs.getInt("tues_wed_thu_after17h"));
                p.setTuesWedThurAfter22(rs.getInt("tues_wed_thu_after22h"));
                p.setFriSatSunBefore22(rs.getInt("fri_sat_sun_before22h"));
                p.setFriSatSunAfter22(rs.getInt("fri_sat_sun_after22h"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Price getAllByCinema(int cinema_id) {
        String sql = "select * from Cinema_Price cp, Price p\n"
                + "where cp.price_id = p.price_id and cp.cinema_id = ? and customer_type = 'adult'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cinema_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Price p = new Price();
                p.setId(rs.getInt("price_id"));
                p.setCustomer_type(rs.getString("customer_type"));
                p.setMon(rs.getInt("monday"));
                p.setTuesWedThurBefore11(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurBefore17(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurAfter17(rs.getInt("tues_wed_thu_after17h"));
                p.setTuesWedThurAfter22(rs.getInt("tues_wed_thu_after22h"));
                p.setFriSatSunBefore22(rs.getInt("fri_sat_sun_before22h"));
                p.setFriSatSunAfter22(rs.getInt("fri_sat_sun_after22h"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Price getAllByScreen(int screen_id) {
        String sql = "select * from Cinema_Price cp, Price p, Screen s\n"
                + "where cp.price_id = p.price_id and s.screen_id = ? "
                + "and customer_type = 'adult' and s.cinema_id = cp.cinema_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, screen_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Price p = new Price();
                p.setId(rs.getInt("price_id"));
                p.setCustomer_type(rs.getString("customer_type"));
                p.setMon(rs.getInt("monday"));
                p.setTuesWedThurBefore11(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurBefore17(rs.getInt("tues_wed_thu_before11h"));
                p.setTuesWedThurAfter17(rs.getInt("tues_wed_thu_after17h"));
                p.setTuesWedThurAfter22(rs.getInt("tues_wed_thu_after22h"));
                p.setFriSatSunBefore22(rs.getInt("fri_sat_sun_before22h"));
                p.setFriSatSunAfter22(rs.getInt("fri_sat_sun_after22h"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Boolean compareLowerHour(String time1, String time2) {
        String[] parts1 = time1.split(":");
        int horaHour1 = Integer.valueOf(parts1[0]);
        int horaMinute1 = Integer.valueOf(parts1[1]);
        int sum1 = 60 * horaHour1 + horaMinute1;

        String[] parts2 = time2.split(":");
        int horaHour2 = Integer.valueOf(parts2[0]);
        int horaMinute2 = Integer.valueOf(parts2[1]);
        int sum2 = 60 * horaHour2 + horaMinute2;

        return sum1 < sum2;
    }

    public int checkPrice(Schedule s) {
        int price = 0;
        Price p = getAllByScreen(s.getScreen_id());
        String date_raw = s.getShowing_date();
        String time = s.getStart_time();
        try {
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date_raw);
            String dayWeekText = new SimpleDateFormat("EEEE").format(date);
            int i = 0;
            switch (dayWeekText) {
                case "Monday":
                    i = 1;
                    break;
                case "Tuesday":
                case "Wednesday":
                case "Thursday":
                    i = 2;
                    break;
                default:
                    i = 3;
            }
            switch (i) {
                case 1:
                    price = p.getMon();
                    break;
                case 2:
                    if (compareLowerHour(time, "11:00")) {
                        price = p.getTuesWedThurBefore11();
                    } else if (compareLowerHour(time, "17:00")) {
                        price = p.getTuesWedThurBefore17();
                    } else if (compareLowerHour(time, "22:00")) {
                        price = p.getTuesWedThurAfter17();
                    } else {
                        price = p.getTuesWedThurAfter22();
                    }
                    break;
                case 3:
                    if (compareLowerHour(time, "22:00")) {
                        price = p.getFriSatSunBefore22();
                    } else {
                        price = p.getFriSatSunAfter22();
                    }
            }
        } catch (ParseException e) {

        }
        return price;
    }

    public static void main(String[] args) throws ParseException {
        PriceDAO pd = new PriceDAO();
        ScheduleDAO scd = new ScheduleDAO();
        Schedule s = scd.getScheduleByID(1072);
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s.getShowing_date());
//        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2022-03-03");
        String dayWeek = new SimpleDateFormat("EEEE").format(date);
//        System.out.println(s.getShowing_date() + dayWeek);
        int p = pd.checkPrice(s);
        System.out.println(s.getShowing_date() + " " + dayWeek +  " " + s.getStart_time() + ": " + p);
    }
}
