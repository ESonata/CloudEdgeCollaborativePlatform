package com.fuful.domain;

import org.omg.CORBA.TIMEOUT;

public class BookLove {
	private String uid;//用户ID
	private int pid;//商品ID；

	public Ticket getBookInfo() {
		return bookInfo;
	}

	public void setBookInfo(Ticket bookInfo) {
		this.bookInfo = bookInfo;
	}

	private int state;
	private Ticket bookInfo;
	
	private String bookName;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
