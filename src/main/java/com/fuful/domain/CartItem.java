package com.fuful.domain;

import java.util.List;

public class CartItem {

	private Ticket product;
	private int buyNum;
	private double subtotal;//商品的小记
	private String location;
	private String round;
	private String seat;
	private int roundID;
	private Double price;

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getRound_id() {
		return round_id;
	}

	public void setRound_id(String round_id) {
		this.round_id = round_id;
	}

	private String round_id;

	public int getRoundID() {
		return roundID;
	}

	public void setRoundID(int roundID) {
		this.roundID = roundID;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public Ticket getProduct() {
		return product;
	}
	public void setProduct(Ticket product) {
		this.product = product;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
	
	
}
