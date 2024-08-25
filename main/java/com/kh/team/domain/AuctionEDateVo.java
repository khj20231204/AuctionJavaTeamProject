package com.kh.team.domain;

public class AuctionEDateVo {
	private int e_no;
	private int e_year;
	private int e_month;
	private int e_day;
	private int e_hour;
	private int e_minute;
	private int p_no;
	private int e_second;
	private String deadline;
	
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
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
	@Override
	public String toString() {
		return "AuctionEDateVo [e_no=" + e_no + ", e_year=" + e_year + ", e_month=" + e_month + ", e_day=" + e_day
				+ ", e_hour=" + e_hour + ", e_minute=" + e_minute + ", p_no=" + p_no + ", e_second=" + e_second
				+ ", deadline=" + deadline + "]";
	}
}
