package com.fuful.domain;

public class BookSubType {
	private int ID;
	private int superType;
	private String tname;
	private String otherName;
	private String keyword;
	private String subdesc;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getSuperType() {
		return superType;
	}
	public void setSuperType(int superType) {
		this.superType = superType;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getOtherName() {
		return otherName;
	}
	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSubdesc() {
		return subdesc;
	}
	public void setSubdesc(String subdesc) {
		this.subdesc = subdesc;
	}
	
	
}
