package com.fuful.domain;

/**
 * Created by SunRuiBin on 2019/11/18.
 */
public class Price {

    private int id;
    private String tid;
    private double price;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTid() {
        return tid;

    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



}