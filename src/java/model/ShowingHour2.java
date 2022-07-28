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
public class ShowingHour2 {

    private Screen screen;
    private Movie movie;
    private List<Schedule> list;

    public ShowingHour2() {
    }

    public ShowingHour2(Screen screen, Movie movie, List<Schedule> list) {
        this.screen = screen;
        this.movie = movie;
        this.list = list;
    }

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public List<Schedule> getList() {
        return list;
    }

    public void setList(List<Schedule> list) {
        this.list = list;
    }

}
