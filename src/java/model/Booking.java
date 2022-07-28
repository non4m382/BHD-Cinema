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
public class Booking {
    private int booking_id, user_id, schedule_id;
    private String made_time;

    public Booking() {
    }

    public Booking(int booking_id, int user_id, int schedule_id, String made_time) {
        this.booking_id = booking_id;
        this.user_id = user_id;
        this.schedule_id = schedule_id;
        this.made_time = made_time;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSchedule_id() {
        return schedule_id;
    }

    public void setSchedule_id(int schedule_id) {
        this.schedule_id = schedule_id;
    }

    public String getMade_time() {
        return made_time;
    }

    public void setMade_time(String made_time) {
        this.made_time = made_time;
    }
    
    
}
