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
public class Movie {

    private int movie_id;
    private String name, describe, img, movie_type, trailer, showing_from_date, showing_to_date;
    private int length_time;

    public Movie() {
    }

    public Movie(int movie_id, String name, String describe, String img, int length_time, String movie_type, String trailer, String showing_from_date, String showing_to_date) {
        this.movie_id = movie_id;
        this.name = name;
        this.describe = describe;
        this.img = img;
        this.movie_type = movie_type;
        this.trailer = trailer;
        this.showing_from_date = showing_from_date;
        this.showing_to_date = showing_to_date;
        this.length_time = length_time;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getMovie_type() {
        return movie_type;
    }

    public void setMovie_type(String movie_type) {
        this.movie_type = movie_type;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getShowing_from_date() {
        return showing_from_date;
    }

    public void setShowing_from_date(String showing_from_date) {
        this.showing_from_date = showing_from_date;
    }

    public String getShowing_to_date() {
        return showing_to_date;
    }

    public void setShowing_to_date(String showing_to_date) {
        this.showing_to_date = showing_to_date;
    }

    public int getLength_time() {
        return length_time;
    }

    public void setLength_time(int length_time) {
        this.length_time = length_time;
    }

}
