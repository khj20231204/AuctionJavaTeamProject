package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionSoldVo {
	private int p_no;
	private String seller;
	private String p_title;
	private String p_content;
	private int present_price;
	//private int instant_price;
	private String purchaser;
	private int sold_price;
	private String sell_status;
	
	private int address_no;
	private String zip;
	private String road_address;
	private String jibun_address;
	private String detail_address;
	
	private int r_no;
	private int r_year;
	private int r_month;
	private int r_day;
	private int r_hour;
	private int r_minute;
	private int r_second;
	/*
	private int s_no;
	private int s_year;
	private int s_month;
	private int s_day;
	private int s_hour;
	private int s_minute;
	*/
	private int main_img_no;
	private String main_img_name;
	
	private int bid_no;
	private String purchaser_id;
	private String seller_id;
	private int bid_price;
	private Timestamp bid_date;
	
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
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_year() {
		return r_year;
	}
	public void setR_year(int r_year) {
		this.r_year = r_year;
	}
	public int getR_month() {
		return r_month;
	}
	public void setR_month(int r_month) {
		this.r_month = r_month;
	}
	public int getR_day() {
		return r_day;
	}
	public void setR_day(int r_day) {
		this.r_day = r_day;
	}
	public int getR_hour() {
		return r_hour;
	}
	public void setR_hour(int r_hour) {
		this.r_hour = r_hour;
	}
	public int getR_minute() {
		return r_minute;
	}
	public void setR_minute(int r_minute) {
		this.r_minute = r_minute;
	}
	public int getR_second() {
		return r_second;
	}
	public void setR_second(int r_second) {
		this.r_second = r_second;
	}
	public int getMain_img_no() {
		return main_img_no;
	}
	public void setMain_img_no(int main_img_no) {
		this.main_img_no = main_img_no;
	}
	public String getMain_img_name() {
		return main_img_name;
	}
	public void setMain_img_name(String main_img_name) {
		this.main_img_name = main_img_name;
	}
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
	@Override
	public String toString() {
		return "AuctionSoldVo [p_no=" + p_no + ", seller=" + seller + ", p_title=" + p_title + ", p_content="
				+ p_content + ", present_price=" + present_price + ", purchaser=" + purchaser + ", sold_price="
				+ sold_price + ", sell_status=" + sell_status + ", address_no=" + address_no + ", zip=" + zip
				+ ", road_address=" + road_address + ", jibun_address=" + jibun_address + ", detail_address="
				+ detail_address + ", r_no=" + r_no + ", r_year=" + r_year + ", r_month=" + r_month + ", r_day=" + r_day
				+ ", r_hour=" + r_hour + ", r_minute=" + r_minute + ", r_second=" + r_second + ", main_img_no="
				+ main_img_no + ", main_img_name=" + main_img_name + ", bid_no=" + bid_no + ", purchaser_id="
				+ purchaser_id + ", seller_id=" + seller_id + ", bid_price=" + bid_price + ", bid_date=" + bid_date
				+ "]";
	}
}
