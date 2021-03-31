package com.fuful.domain;

import java.util.Date;

public class Book {

	private int ID;		  //图书ID
	private int typeBID;  //大类
	private int typeID;   //小类别
	private String bookName; //图书名称
	private String introduce;  //图书简介
	private Double price;	//定价
	private Double nowPrice; //现价
	private String picture; //图片文件
	private String  INTime; //录入时间
	private int newBook;  //是否是新书，1是，0不是
	private int sale;    //是否是打折，1是，0不是
	private int hit;    //浏览次数
	private String author;//作者姓名
	private String publish;//图书出版社
	private BookSubType booksubtype;
	private String typeBIDName;
	private String typeIDName;
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
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	public int getNewBook() {
		return newBook;
	}
	public void setNewBook(int newBook) {
		this.newBook = newBook;
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
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
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
