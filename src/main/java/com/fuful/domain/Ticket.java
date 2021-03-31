package com.fuful.domain;

/**
 * Created by SunRuiBin on 2019/11/18.
 */
public class Ticket {

    private int ID;		  //图书ID
    private int typeBID;  //大类
    private int typeID;   //小类别
    private String ticketName; //图书名称
    private String introduce;  //图书简介
    private Double price;	//定价
    private Double nowPrice; //现价
    private String picture; //图片文件
    private String  INTime; //录入时间
    private int newTicket;  //是否是新书，1是，0不是
    private int sale;    //是否是打折，1是，0不是
    private int hit;    //浏览次数
    private String author;//作者姓名
    private String amount;//票务容量
    private BookSubType booksubtype;
    private String typeBIDName;
    private String typeIDName;
    private String place;

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    private int love;
    public int getID() {
        return ID;
    }
    public void setID(int iD) {
        ID = iD;
    }
    public int getTypeBID() {
        return typeBID;
    }
    public void setTypeBID(int typeBID) {
        this.typeBID = typeBID;
    }
    public int getTypeID() {
        return typeID;
    }
    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getIntroduce() {
        return introduce;
    }
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
    public Double getPrice() {
        return price;
    }
    public void setPrice(Double price) {
        this.price = price;
    }
    public Double getNowPrice() {
        return nowPrice;
    }
    public void setNowPrice(Double nowPrice) {
        this.nowPrice = nowPrice;
    }
    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }
    public String getINTime() {
        return INTime;
    }
    public void setINTime(String INTime) {
        this.INTime = INTime;
    }

    public String getTicketName() {
        return ticketName;
    }

    public void setTicketName(String ticketName) {
        this.ticketName = ticketName;
    }

    public int getNewTicket() {
        return newTicket;
    }

    public void setNewTicket(int newTicket) {
        this.newTicket = newTicket;
    }

    public int getSale() {
        return sale;
    }
    public void setSale(int sale) {
        this.sale = sale;
    }
    public int getHit() {
        return hit;
    }
    public void setHit(int hit) {
        this.hit = hit;
    }
    public BookSubType getBooksubtype() {
        return booksubtype;
    }
    public void setBooksubtype(BookSubType booksubtype) {
        this.booksubtype = booksubtype;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public int getLove() {
        return love;
    }
    public void setLove(int love) {
        this.love = love;
    }
    public String getTypeBIDName() {
        return typeBIDName;
    }
    public void setTypeBIDName(String typeBIDName) {
        this.typeBIDName = typeBIDName;
    }
    public String getTypeIDName() {
        return typeIDName;
    }
    public void setTypeIDName(String typeIDName) {
        this.typeIDName = typeIDName;
    }

}
