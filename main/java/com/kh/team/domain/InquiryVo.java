package com.kh.team.domain;

import java.sql.Timestamp;

public class InquiryVo {
	private int inquiry_no;
	private String m_id;
	private String email;
	private String inquiry_title;
	private String inquiry_content;
	private Timestamp inquiry_reg;
	
	public int getInquiry_no() {
		return inquiry_no;
	}
	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public Timestamp getInquiry_reg() {
		return inquiry_reg;
	}
	public void setInquiry_reg(Timestamp inquiry_reg) {
		this.inquiry_reg = inquiry_reg;
	}
	@Override
	public String toString() {
		return "InquiryVo [inquiry_no=" + inquiry_no + ", m_id=" + m_id + ", email=" + email + ", inquiry_title="
				+ inquiry_title + ", inquiry_content=" + inquiry_content + ", inquiry_reg=" + inquiry_reg + "]";
	}
	
}
