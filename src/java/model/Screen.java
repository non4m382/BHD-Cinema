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
public class Screen {

    private int screen_id, cinema_id, screen_number;
    private String screen_type;
    private int screen_detail_id;

    public Screen() {
    }

    public Screen(int screen_id, int cinema_id, int screen_number, String screen_type, int screen_detail_id) {
        this.screen_id = screen_id;
        this.cinema_id = cinema_id;
        this.screen_number = screen_number;
        this.screen_type = screen_type;
        this.screen_detail_id = screen_detail_id;
    }

    public int getScreen_id() {
        return screen_id;
    }

    public void setScreen_id(int screen_id) {
        this.screen_id = screen_id;
    }

    public int getCinema_id() {
        return cinema_id;
    }

    public void setCinema_id(int cinema_id) {
        this.cinema_id = cinema_id;
    }

    public int getScreen_number() {
        return screen_number;
    }

    public void setScreen_number(int screen_number) {
        this.screen_number = screen_number;
    }

    public String getScreen_type() {
        return screen_type;
    }

    public void setScreen_type(String screen_type) {
        this.screen_type = screen_type;
    }

    public int getScreen_detail_id() {
        return screen_detail_id;
    }

    public void setScreen_detail_id(int screen_detail_id) {
        this.screen_detail_id = screen_detail_id;
    }

}
