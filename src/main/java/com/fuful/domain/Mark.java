package com.fuful.domain;

import java.sql.Date;

public class Mark {
	
	private String uid;
	private String uname;
	private int bid;
	private String bname;
	private Date marktime;
	private String comment;
	private String mid;
	private Book bookInfo;
	private Ticket ticketInfo;

	public Ticket getTicketInfo() {
		return ticketInfo;
	}

	public void setTicketInfo(Ticket ticketInfo) {
		this.ticketInfo = ticketInfo;
	}

	public Book getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(Book bookInfo) {
		this.bookInfo = bookInfo;
	}

	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public Date getMarktime() {
		return marktime;
	}
	public void setMarktime(Date date) {
		this.marktime = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
