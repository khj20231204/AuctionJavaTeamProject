package com.kh.team.domain;

public class BuyComputerVo {
	
	private int price; //가격
	private String seller; //판매자
	private int productNum; //상품갯수
	private String productName; //상품명
	private String sendMethod; //배송방법
	private int p_no; //pk
	private int c_com_no; //상품번호
	private String m_id; //아이디
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSendMethod() {
		return sendMethod;
	}
	public void setSendMethod(String sendMethod) {
		this.sendMethod = sendMethod;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getC_com_no() {
		return c_com_no;
	}
	public void setC_com_no(int c_com_no) {
		this.c_com_no = c_com_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "BuyComputerVo [price=" + price + ", seller=" + seller + ", productNum=" + productNum + ", productName="
				+ productName + ", sendMethod=" + sendMethod + ", p_no=" + p_no + ", c_com_no=" + c_com_no + ", m_id="
				+ m_id + "]";
	}
	
}
