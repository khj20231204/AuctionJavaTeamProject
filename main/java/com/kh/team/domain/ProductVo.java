package com.kh.team.domain;

import java.sql.Timestamp;

public class ProductVo {
	private int p_no; // 상품번호
	private String p_name; // 상품이름
	private String p_seller; // 판매자
	private int p_price; // 가격
	private String cate_no; // 카테고리 번호
	private String p_content; // 상품 설명
	private String p_thumbimg; // 썸네일 이미지
	private Timestamp p_regdate; // 상품등록날짜
	private int p_no2;
	private String road_address;
	
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
	public String getP_seller() {
		return p_seller;
	}
	public void setP_seller(String p_seller) {
		this.p_seller = p_seller;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getCate_no() {
		return cate_no;
	}
	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
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
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	
	@Override
	public String toString() {
		return "ProductVo [p_no=" + p_no + ", p_name=" + p_name + ", p_seller=" + p_seller + ", p_price=" + p_price
				+ ", cate_no=" + cate_no + ", p_content=" + p_content + ", p_thumbimg=" + p_thumbimg + ", p_regdate="
				+ p_regdate + ", p_no2=" + p_no2 + ", road_address=" + road_address + "]";
	}
	
	
	
}
