package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionVo {
	private int p_no;
	private String seller;
	private String p_title;
	private String p_content;
	private int present_price;
	private int instant_price;
	private String purchaser;
	private int sold_price;
	private String sell_status;
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getPresent_price() {
		return present_price;
	}
	public void setPresent_price(int present_price) {
		this.present_price = present_price;
	}
	public int getInstant_price() {
		return instant_price;
	}
	public void setInstant_price(int instant_price) {
		this.instant_price = instant_price;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public int getSold_price() {
		return sold_price;
	}
	public void setSold_price(int sold_price) {
		this.sold_price = sold_price;
	}
	public String getSell_status() {
		return sell_status;
	}
	public void setSell_status(String sell_status) {
		this.sell_status = sell_status;
	}
	@Override
	public String toString() {
		return "AuctionVo [p_no=" + p_no + ", seller=" + seller + ", p_title=" + p_title + ", p_content=" + p_content
				+ ", present_price=" + present_price + ", instant_price=" + instant_price
				+ ", purchaser=" + purchaser + ", sold_price=" + sold_price + ", sell_status=" + sell_status + "]";
	}
}
