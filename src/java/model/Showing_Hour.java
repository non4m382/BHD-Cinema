/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Showing_Hour {
    private Cinema cinema;
    private Screen screen;
    private List<Schedule> schedule_list;

    public Showing_Hour() {
    }

    public Showing_Hour(Cinema cinema, Screen screen, List<Schedule> schedule_list) {
        this.cinema = cinema;
        this.screen = screen;
        this.schedule_list = schedule_list;
    }

    public Cinema getCinema() {
        return cinema;
    }

    public void setCinema(Cinema cinema) {
        this.cinema = cinema;
    }

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    public List<Schedule> getSchedule_list() {
        return schedule_list;
    }

    public void setSchedule_list(List<Schedule> schedule_list) {
        this.schedule_list = schedule_list;
    }
    
    
    
}
