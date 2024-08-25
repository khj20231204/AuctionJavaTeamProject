package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionBidVo {
	private int bid_no;
	private String purchaser_id;
	private String seller_id;
	private int bid_price;
	private Timestamp bid_date;
	private int p_no;
	
	public int getBid_no() {
		return bid_no;
	}
	public void setBid_no(int bid_no) {
		this.bid_no = bid_no;
	}
	public String getPurchaser_id() {
		return purchaser_id;
	}
	public void setPurchaser_id(String purchaser_id) {
		this.purchaser_id = purchaser_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public Timestamp getBid_date() {
		return bid_date;
	}
	public void setBid_date(Timestamp bid_date) {
		this.bid_date = bid_date;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionBidVo [bid_no=" + bid_no + ", purchaser_id=" + purchaser_id + ", seller_id=" + seller_id
				+ ", bid_price=" + bid_price + ", bid_date=" + bid_date + ", p_no=" + p_no + "]";
	}
}
