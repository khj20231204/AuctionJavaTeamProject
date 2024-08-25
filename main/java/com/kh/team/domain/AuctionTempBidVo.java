package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionTempBidVo {
	private int temp_bid_no;
	private String temp_purchaser_id;
	private String temp_seller_id;
	private int temp_bid_price;
	private Timestamp temp_bid_date;
	private int p_no;
	
	public AuctionTempBidVo() {
		super();
	}
	public AuctionTempBidVo(String temp_purchaser_id, String temp_seller_id, int temp_bid_price,
			Timestamp temp_bid_date, int p_no) {
		super();
		this.temp_purchaser_id = temp_purchaser_id;
		this.temp_seller_id = temp_seller_id;
		this.temp_bid_price = temp_bid_price;
		this.temp_bid_date = temp_bid_date;
		this.p_no = p_no;
	}
	public int getTemp_bid_no() {
		return temp_bid_no;
	}
	public void setTemp_bid_no(int temp_bid_no) {
		this.temp_bid_no = temp_bid_no;
	}
	public String getTemp_purchaser_id() {
		return temp_purchaser_id;
	}
	public void setTemp_purchaser_id(String temp_purchaser_id) {
		this.temp_purchaser_id = temp_purchaser_id;
	}
	public String getTemp_seller_id() {
		return temp_seller_id;
	}
	public void setTemp_seller_id(String temp_seller_id) {
		this.temp_seller_id = temp_seller_id;
	}
	public int getTemp_bid_price() {
		return temp_bid_price;
	}
	public void setTemp_bid_price(int temp_bid_price) {
		this.temp_bid_price = temp_bid_price;
	}
	public Timestamp getTemp_bid_date() {
		return temp_bid_date;
	}
	public void setTemp_bid_date(Timestamp temp_bid_date) {
		this.temp_bid_date = temp_bid_date;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionTempBidVo [temp_bid_no=" + temp_bid_no + ", temp_purchaser_id=" + temp_purchaser_id
				+ ", temp_seller_id=" + temp_seller_id + ", temp_bid_price=" + temp_bid_price + ", temp_bid_date="
				+ temp_bid_date + ", p_no=" + p_no + "]";
	}
}
