package com.fuful.domain;

public class BookSuperType {
	private int ID;
	private String tname;
	private String aname;
	private String keyword;
	private String supdesc;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getSupdesc() {
		return supdesc;
	}
	public void setSupdesc(String supdesc) {
		this.supdesc = supdesc;
	}
}
