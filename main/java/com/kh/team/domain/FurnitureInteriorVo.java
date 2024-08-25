package com.kh.team.domain;

import java.sql.Timestamp;

public class FurnitureInteriorVo {

	private int interior_no;
	private String interior_name;
	private String cate_no;
	private int interior_price;
	private String interior_content;
	private String interior_seller;
	private String interior_thumbimg;
	private Timestamp interior_regdate;
	private int p_no;
	
	public int getInterior_no() {
		return interior_no;
	}
	public void setInterior_no(int interior_no) {
		this.interior_no = interior_no;
	}
	public String getInterior_name() {
		return interior_name;
	}
	public void setInterior_name(String interior_name) {
		this.interior_name = interior_name;
	}
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public int getInterior_price() {
		return interior_price;
	}
	public void setInterior_price(int interior_price) {
		this.interior_price = interior_price;
	}
	public String getInterior_content() {
		return interior_content;
	}
	public void setInterior_content(String interior_content) {
		this.interior_content = interior_content;
	}
	public String getInterior_seller() {
		return interior_seller;
	}
	public void setInterior_seller(String interior_seller) {
		this.interior_seller = interior_seller;
	}
	public String getInterior_thumbimg() {
		return interior_thumbimg;
	}
	public void setInterior_thumbimg(String interior_thumbimg) {
		this.interior_thumbimg = interior_thumbimg;
	}
	public Timestamp getInterior_regdate() {
		return interior_regdate;
	}
	public void setInterior_regdate(Timestamp interior_regdate) {
		this.interior_regdate = interior_regdate;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "FurnitureInteriorVo [interior_no=" + interior_no + ", interior_name=" + interior_name + ", cate_no="
				+ cate_no + ", interior_price=" + interior_price + ", interior_content=" + interior_content
				+ ", interior_seller=" + interior_seller + ", interior_thumbimg=" + interior_thumbimg
				+ ", interior_regdate=" + interior_regdate + ", p_no=" + p_no + "]";
	}
}
