package com.kh.team.domain;

public class AuctionRDateVo {
	private int r_no;
	private int r_year;
	private int r_month;
	private int r_day;
	private int r_hour;
	private int r_minute;
	private int r_second;
	private int p_no;
	
	public AuctionRDateVo() {
		super();
	}
	public AuctionRDateVo(int r_year, int r_month, int r_day, int r_hour, int r_minute, int r_second,
			int p_no) {
		super();
		this.r_year = r_year;
		this.r_month = r_month;
		this.r_day = r_day;
		this.r_hour = r_hour;
		this.r_minute = r_minute;
		this.r_second = r_second;
		this.p_no = p_no;
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
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionRDateVo [r_no=" + r_no + ", r_year=" + r_year + ", r_month=" + r_month + ", r_day=" + r_day
				+ ", r_hour=" + r_hour + ", r_minute=" + r_minute + ", r_second=" + r_second + ", p_no=" + p_no + "]";
	}
}
