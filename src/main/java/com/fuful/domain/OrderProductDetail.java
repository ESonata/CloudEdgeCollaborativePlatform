package com.fuful.domain;

import java.util.List;

/**
 * Created by SunRuiBin on 2019/11/16.
 */
public class OrderProductDetail {
//     map.put("count", rs.getInt("count"));
//                map.put("subtotal", rs.getString("subtotal"));
//                map.put("picture", rs.getString("picture"));
//                map.put("bookName", rs.getString("bookName"));
//                map.put("price", rs.getDouble("price"));
    private int count;
    private double subtotal;
    private String itemid;
    private String location;
    private String round;

    private String ticketName;

    public String getTicketName() {
        return ticketName;
    }

    public void setTicketName(String ticketName) {
        this.ticketName = ticketName;
    }

    private String picture;
    private String bookName;
    private Double price;


    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public List<SeatLog> getSeatLogList() {
        return seatLogList;
    }

    public void setSeatLogList(List<SeatLog> seatLogList) {
        this.seatLogList = seatLogList;
    }

    private List<SeatLog> seatLogList;
    private String place;

    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getCount() {
        return count;
    }



    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
