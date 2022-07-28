/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Schedule {

    private int schedule_id, screen_id, movie_id;
    private String showing_date, start_time;

    public Schedule() {
    }

    public Schedule(int schedule_id, int movie_id, int screen_id, String showing_date, String start_time) {
        this.schedule_id = schedule_id;
        this.screen_id = screen_id;
        this.movie_id = movie_id;
        this.showing_date = showing_date;
        this.start_time = start_time;
    }

    public int getScreen_id() {
        return screen_id;
    }

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public void setScreen_id(int screen_id) {
        this.screen_id = screen_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getShowing_date() {
        return showing_date;
    }

    public void setShowing_date(String showing_date) {
        this.showing_date = showing_date;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

}
