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
public class Transaction {
    private int transaction_id, price;
    private String made_time, cinema_name, movie_name;

    public Transaction() {
    }

    public Transaction(int transaction_id, String made_time, String cinema_name, String movie_name, int price) {
        this.transaction_id = transaction_id;
        this.price = price;
        this.made_time = made_time;
        this.cinema_name = cinema_name;
        this.movie_name = movie_name;
    }

    public int getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(int transaction_id) {
        this.transaction_id = transaction_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getMade_time() {
        return made_time;
    }

    public void setMade_time(String made_time) {
        this.made_time = made_time;
    }

    public String getCinema_name() {
        return cinema_name;
    }

    public void setCinema_name(String cinema_name) {
        this.cinema_name = cinema_name;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }
    
    
}
