package com.kh.team.domain;

public class AuctionSDateVo {
	private int s_no;
	private int s_year;
	private int s_month;
	private int s_day;
	private int s_hour;
	private int s_minute;
	private int p_no;
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_year() {
		return s_year;
	}
	public void setS_year(int s_year) {
		this.s_year = s_year;
	}
	public int getS_month() {
		return s_month;
	}
	public void setS_month(int s_month) {
		this.s_month = s_month;
	}
	public int getS_day() {
		return s_day;
	}
	public void setS_day(int s_day) {
		this.s_day = s_day;
	}
	public int getS_hour() {
		return s_hour;
	}
	public void setS_hour(int s_hour) {
		this.s_hour = s_hour;
	}
	public int getS_minute() {
		return s_minute;
	}
	public void setS_minute(int s_minute) {
		this.s_minute = s_minute;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionSDateVo [s_no=" + s_no + ", s_year=" + s_year + ", s_month=" + s_month + ", s_day=" + s_day
				+ ", s_hour=" + s_hour + ", s_minute=" + s_minute + ", p_no=" + p_no + "]";
	}
}
