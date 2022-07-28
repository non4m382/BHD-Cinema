/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import model.CreateDate;
import model.Movie;
import model.Schedule;
import model.Showing_Hour;

/**
 *
 * @author Admin
 */
public class Test {

    public static void main(String[] args) {
        // get movie
//        String name = "HOUSE OF GUCCI";
//        MovieDAO md = new MovieDAO();
//        Movie m = md.getMovieByName(name);
//        // get 11 showing_days
//        CreateDate cdate = new CreateDate();
//        LinkedHashMap<Date, String> map = cdate.createDate();
//
//        // screate showing_hour for each day
//        ScheduleDAO sd = new ScheduleDAO();
//        for (Date d : map.keySet()) {
//            String normal_date = new SimpleDateFormat("yyyy-MM-dd").format(d);
//            // list showing_hour trong normal_date
//            List<Showing_Hour> list = sd.getShowing_HourByDate(normal_date);
//            for (Showing_Hour sh : list) {
//                System.out.println(sh.getCinema().getName() + "\t" + sh.getCinema().getAddress());
//                System.out.println("Screen: " + sh.getScreen().getScreen_number());
//                for (Schedule s : sh.getSchedule_list()) {
//                    System.out.println("- " + s.getStart_time());
//                }
//            }
//        }

//        LinkedHashMap<Date, List<Schedule>> daymap = new LinkedHashMap<>();
//        for (Date d : map.keySet()) {
//            String day = new SimpleDateFormat("yyyy-MM-dd").format(d);
//            List<Schedule> list = sd.getScheduleByDate2(name, day);
//            daymap.put(d, list);
//        }
//        request.setAttribute("daymap", daymap);
        String s = "-B5-A5";
        if (s != null && !s.isEmpty() && !s.equals("null") && !s.equals("-")) {
            // doSomething
            String[] a = s.split("-");
            for (int i = 1; i < a.length; i++) {
                System.out.println(a[i]);
            }
        }
        else {
            System.out.println("Empty");
        }

    }
}
