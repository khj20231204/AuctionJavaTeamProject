package com.kh.team.domain;

import java.sql.Timestamp;

public class ProductExplainVo {
	private int p_e_no; //상품문의 pk
	private String p_e_answer_status; //상품문의 답변상태
	private String p_e_inquiry_status; //상품문의 종류
	private String p_e_title; //제목
	private String p_e_id; //작성자 아이디
	private Timestamp p_e_regdate; //작성날짜
	private String p_e_product; //상품문의 대상 제품
	private String p_e_re; //답변내용
	public int getP_e_no() {
		return p_e_no;
	}
	public void setP_e_no(int p_e_no) {
		this.p_e_no = p_e_no;
	}
	public String getP_e_answer_status() {
		return p_e_answer_status;
	}
	public void setP_e_answer_status(String p_e_answer_status) {
		this.p_e_answer_status = p_e_answer_status;
	}
	public String getP_e_inquiry_status() {
		return p_e_inquiry_status;
	}
	public void setP_e_inquiry_status(String p_e_inquiry_status) {
		this.p_e_inquiry_status = p_e_inquiry_status;
	}
	public String getP_e_title() {
		return p_e_title;
	}
	public void setP_e_title(String p_e_title) {
		this.p_e_title = p_e_title;
	}
	public String getP_e_id() {
		return p_e_id;
	}
	public void setP_e_id(String p_e_id) {
		this.p_e_id = p_e_id;
	}
	public Timestamp getP_e_regdate() {
		return p_e_regdate;
	}
	public void setP_e_regdate(Timestamp p_e_regdate) {
		this.p_e_regdate = p_e_regdate;
	}
	public String getP_e_product() {
		return p_e_product;
	}
	public void setP_e_product(String p_e_product) {
		this.p_e_product = p_e_product;
	}
	public String getP_e_re() {
		return p_e_re;
	}
	public void setP_e_re(String p_e_re) {
		this.p_e_re = p_e_re;
	}
	@Override
	public String toString() {
		return "ProductExplainVo [p_e_no=" + p_e_no + ", p_e_answer_status=" + p_e_answer_status
				+ ", p_e_inquiry_status=" + p_e_inquiry_status + ", p_e_title=" + p_e_title + ", p_e_id=" + p_e_id
				+ ", p_e_regdate=" + p_e_regdate + ", p_e_product=" + p_e_product + ", p_e_re=" + p_e_re + "]";
	}
	
	
}
