package com.kh.team.domain;

import java.sql.Timestamp;

public class ClothesVo {
	private int p_no;
	private String p_name;
	private String cate_no;
	private int p_price;
	private String p_content;
	private String p_seller;
	private String p_thumbimg;
	private Timestamp p_regdate;
	private int p_no2;
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getCate_no() {
		return cate_no;
	}

	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_seller() {
		return p_seller;
	}

	public void setP_seller(String p_seller) {
		this.p_seller = p_seller;
	}

	public String getP_thumbimg() {
		return p_thumbimg;
	}

	public void setP_thumbimg(String p_thumbimg) {
		this.p_thumbimg = p_thumbimg;
	}

	public Timestamp getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(Timestamp p_regdate) {
		this.p_regdate = p_regdate;
	}

	public int getP_no2() {
		return p_no2;
	}

	public void setP_no2(int p_no2) {
		this.p_no2 = p_no2;
	}

	@Override
	public String toString() {
		return "ClothesVo [p_no=" + p_no + ", p_name=" + p_name + ", cate_no=" + cate_no + ", p_price=" + p_price
				+ ", p_content=" + p_content + ", p_seller=" + p_seller + ", p_thumbimg=" + p_thumbimg + ", p_regdate="
				+ p_regdate + ", p_no2=" + p_no2 + "]";
	}
	
}
