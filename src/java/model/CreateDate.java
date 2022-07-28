/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.ScheduleDAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CreateDate {

    private static final long MILLIS_IN_A_DAY = 1000 * 60 * 60 * 24;

    private static java.util.Date findNextDay(java.util.Date date) {
        return new java.util.Date(date.getTime() + MILLIS_IN_A_DAY);
    }

    public LinkedHashMap<Date, List<Showing_Hour>> createShowingHourByDateMovieID(int movieid) {
        Date d = new java.util.Date();
        LinkedHashMap<Date, List<Showing_Hour>> map = new LinkedHashMap<>();
        int i = 0;
        while (i < 14) {
            String normal_date = new SimpleDateFormat("yyyy-MM-dd").format(d);
            // list showing_hour trong normal_date
            ScheduleDAO sd = new ScheduleDAO();
            List<Showing_Hour> list = sd.getShowing_HourByDate(normal_date, movieid);
            map.put(d, list);
            d = findNextDay(d);
            i++;
        }
        return map;
    }

    public LinkedHashMap<Date, List<ShowingHour2>> createShowingHourByDateCinemaID(int cinemaid) {
        Date d = new java.util.Date();
        LinkedHashMap<Date, List<ShowingHour2>> map = new LinkedHashMap<>();
        int i = 0;
        while (i < 14) {
            String normal_date = new SimpleDateFormat("yyyy-MM-dd").format(d);
            // list showing_hour trong normal_date
            ScheduleDAO sd = new ScheduleDAO();
            List<ShowingHour2> list = sd.getShowingHourByDateCinemaID(normal_date, cinemaid);
            map.put(d, list);
            d = findNextDay(d);
            i++;
        }
        return map;
    }

    public static void main(String[] args) {
        CreateDate cd = new CreateDate();
//        LinkedHashMap<Date, List<Showing_Hour>> map = cd.createShowingHourByDateMovieID(1);
//        for (Date d : map.keySet()) {
//            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(d));
//            System.out.println(new SimpleDateFormat("EEEE").format(d));
//            if (map.get(d).isEmpty()) {
//                System.out.println("Empty");
//            }
//            for (Showing_Hour sh : map.get(d)) {
//                System.out.println(sh.getCinema().getName() + "\t" + sh.getCinema().getAddress());
//                System.out.println("Screen: " + sh.getScreen().getScreen_number());
//                for (Schedule s : sh.getSchedule_list()) {
//                    System.out.println("- " + s.getStart_time());
//            }
//            }
//        }

        LinkedHashMap<Date, List<ShowingHour2>> map = cd.createShowingHourByDateCinemaID(1);
        for (Date d : map.keySet()) {
            System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(d));
            System.out.println(new SimpleDateFormat("EEEE").format(d));
            if (map.get(d).isEmpty()) {
                System.out.println("Empty");
            }
            for (ShowingHour2 sh : map.get(d)) {
                System.out.println(sh.getMovie().getName());
                System.out.println("Screen: " + sh.getScreen().getScreen_number());
                for (Schedule s : sh.getList()) {
                    System.out.println("- " + s.getStart_time());
                }
            }
        }
    }
}
