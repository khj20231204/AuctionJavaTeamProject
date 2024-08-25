package com.kh.team.domain;

public class AuctionDateAndTimeVo {
	private int n_year;
	private int n_month;
	private int n_day;
	private int n_hour;
	private int n_minute;
	private int n_second;
	
	public AuctionDateAndTimeVo() {
		super();
	}
	public AuctionDateAndTimeVo(int n_year, int n_month, int n_day, int n_hour, int n_minute, int n_second) {
		super();
		this.n_year = n_year;
		this.n_month = n_month;
		this.n_day = n_day;
		this.n_hour = n_hour;
		this.n_minute = n_minute;
		this.n_second = n_second;
	}
	public int getN_year() {
		return n_year;
	}
	public void setN_year(int n_year) {
		this.n_year = n_year;
	}
	public int getN_month() {
		return n_month;
	}
	public void setN_month(int n_month) {
		this.n_month = n_month;
	}
	public int getN_day() {
		return n_day;
	}
	public void setN_day(int n_day) {
		this.n_day = n_day;
	}
	public int getN_hour() {
		return n_hour;
	}
	public void setN_hour(int n_hour) {
		this.n_hour = n_hour;
	}
	public int getN_minute() {
		return n_minute;
	}
	public void setN_minute(int n_minute) {
		this.n_minute = n_minute;
	}
	public int getN_second() {
		return n_second;
	}
	public void setN_second(int n_second) {
		this.n_second = n_second;
	}
	@Override
	public String toString() {
		return "AuctionDateAndTimeVo [n_year=" + n_year + ", n_month=" + n_month + ", n_day=" + n_day + ", n_hour="
				+ n_hour + ", n_minute=" + n_minute + ", n_second=" + n_second + "]";
	}
}
