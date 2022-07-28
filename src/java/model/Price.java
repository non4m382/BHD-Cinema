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
public class Price {

    private int id, mon, tuesWedThurBefore11, tuesWedThurBefore17,
            tuesWedThurAfter17, tuesWedThurAfter22, friSatSunBefore22, friSatSunAfter22;
    private String customer_type;

    public Price() {
    }

    public Price(int id, int mon, int tuesWedThurBefore11, int tuesWedThurBefore17, int tuesWedThurAfter17, int tuesWedThurAfter22, int friSatSunBefore22, int friSatSunAfter22, String customer_type) {
        this.id = id;
        this.mon = mon;
        this.tuesWedThurBefore11 = tuesWedThurBefore11;
        this.tuesWedThurBefore17 = tuesWedThurBefore17;
        this.tuesWedThurAfter17 = tuesWedThurAfter17;
        this.tuesWedThurAfter22 = tuesWedThurAfter22;
        this.friSatSunBefore22 = friSatSunBefore22;
        this.friSatSunAfter22 = friSatSunAfter22;
        this.customer_type = customer_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMon() {
        return mon;
    }

    public void setMon(int mon) {
        this.mon = mon;
    }

    public int getTuesWedThurBefore11() {
        return tuesWedThurBefore11;
    }

    public void setTuesWedThurBefore11(int tuesWedThurBefore11) {
        this.tuesWedThurBefore11 = tuesWedThurBefore11;
    }

    public int getTuesWedThurBefore17() {
        return tuesWedThurBefore17;
    }

    public void setTuesWedThurBefore17(int tuesWedThurBefore17) {
        this.tuesWedThurBefore17 = tuesWedThurBefore17;
    }

    public int getTuesWedThurAfter17() {
        return tuesWedThurAfter17;
    }

    public void setTuesWedThurAfter17(int tuesWedThurAfter17) {
        this.tuesWedThurAfter17 = tuesWedThurAfter17;
    }

    public int getTuesWedThurAfter22() {
        return tuesWedThurAfter22;
    }

    public void setTuesWedThurAfter22(int tuesWedThurAfter22) {
        this.tuesWedThurAfter22 = tuesWedThurAfter22;
    }

    public int getFriSatSunBefore22() {
        return friSatSunBefore22;
    }

    public void setFriSatSunBefore22(int friSatSunBefore22) {
        this.friSatSunBefore22 = friSatSunBefore22;
    }

    public int getFriSatSunAfter22() {
        return friSatSunAfter22;
    }

    public void setFriSatSunAfter22(int friSatSunAfter22) {
        this.friSatSunAfter22 = friSatSunAfter22;
    }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    
}
