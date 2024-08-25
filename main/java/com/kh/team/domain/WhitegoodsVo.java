package com.kh.team.domain;

import java.sql.Timestamp;

public class WhitegoodsVo {
	private int w_no;
	private String w_name;
	private String cate_no;
	private int w_price;
	private String w_content;
	private String w_seller;
	private String w_thumbimg;
	private Timestamp w_regdate;
	private int p_no;
	private int p_readcount;
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public int getW_price() {
		return w_price;
	}
	public void setW_price(int w_price) {
		this.w_price = w_price;
	}
	public String getW_content() {
		return w_content;
	}
	public void setW_content(String w_content) {
		this.w_content = w_content;
	}
	public String getW_seller() {
		return w_seller;
	}
	public void setW_seller(String w_seller) {
		this.w_seller = w_seller;
	}
	public String getW_thumbimg() {
		return w_thumbimg;
	}
	public void setW_thumbimg(String w_thumbimg) {
		this.w_thumbimg = w_thumbimg;
	}
	public Timestamp getW_regdate() {
		return w_regdate;
	}
	public void setW_regdate(Timestamp w_regdate) {
		this.w_regdate = w_regdate;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getP_readcount() {
		return p_readcount;
	}
	public void setP_readcount(int p_readcount) {
		this.p_readcount = p_readcount;
	}
	@Override
	public String toString() {
		return "WhitegoodsVo [w_no=" + w_no + ", w_name=" + w_name + ", cate_no=" + cate_no + ", w_price=" + w_price
				+ ", w_content=" + w_content + ", w_seller=" + w_seller + ", w_thumbimg=" + w_thumbimg + ", w_regdate="
				+ w_regdate + ", p_no=" + p_no + ", p_readcount=" + p_readcount + "]";
	}

}
