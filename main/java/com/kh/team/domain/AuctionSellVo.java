package com.kh.team.domain;

public class AuctionSellVo {
	private int p_no;
	private String seller;
	private String p_title;
	private String p_content;
	private int present_price;
	private int instant_price;
	//private String purchaser;
	//private int sold_price;
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
	
	private int e_no;
	private int e_year;
	private int e_month;
	private int e_day;
	private int e_hour;
	private int e_minute;
	private int e_second;
	private String deadline;
	
	private int main_img_no;
	private String main_img_name;
	
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
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public int getE_year() {
		return e_year;
	}
	public void setE_year(int e_year) {
		this.e_year = e_year;
	}
	public int getE_month() {
		return e_month;
	}
	public void setE_month(int e_month) {
		this.e_month = e_month;
	}
	public int getE_day() {
		return e_day;
	}
	public void setE_day(int e_day) {
		this.e_day = e_day;
	}
	public int getE_hour() {
		return e_hour;
	}
	public void setE_hour(int e_hour) {
		this.e_hour = e_hour;
	}
	public int getE_minute() {
		return e_minute;
	}
	public void setE_minute(int e_minute) {
		this.e_minute = e_minute;
	}
	public int getE_second() {
		return e_second;
	}
	public void setE_second(int e_second) {
		this.e_second = e_second;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
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
	@Override
	public String toString() {
		return "AuctionSellVo [p_no=" + p_no + ", seller=" + seller + ", p_title=" + p_title + ", p_content="
				+ p_content + ", present_price=" + present_price + ", instant_price=" + instant_price + ", sell_status="
				+ sell_status + ", address_no=" + address_no + ", zip=" + zip + ", road_address=" + road_address
				+ ", jibun_address=" + jibun_address + ", detail_address=" + detail_address + ", r_no=" + r_no
				+ ", r_year=" + r_year + ", r_month=" + r_month + ", r_day=" + r_day + ", r_hour=" + r_hour
				+ ", r_minute=" + r_minute + ", r_second=" + r_second + ", e_no=" + e_no + ", e_year=" + e_year
				+ ", e_month=" + e_month + ", e_day=" + e_day + ", e_hour=" + e_hour + ", e_minute=" + e_minute
				+ ", e_second=" + e_second + ", deadline=" + deadline + ", main_img_no=" + main_img_no
				+ ", main_img_name=" + main_img_name + "]";
	}
}
