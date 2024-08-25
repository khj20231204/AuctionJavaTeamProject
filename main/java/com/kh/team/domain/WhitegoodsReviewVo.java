package com.kh.team.domain;

import java.sql.Timestamp;

public class WhitegoodsReviewVo {
	private int review_no;
	private String review_content;
	private String m_id;
	private Timestamp review_reg;
	private int w_no;
	
	
	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public Timestamp getReview_reg() {
		return review_reg;
	}


	public void setReview_reg(Timestamp review_reg) {
		this.review_reg = review_reg;
	}


	public int getW_no() {
		return w_no;
	}


	public void setW_no(int w_no) {
		this.w_no = w_no;
	}


	@Override
	public String toString() {
		return "WhitegoodsReviewVo [review_no=" + review_no + ", review_content=" + review_content + ", m_id=" + m_id
				+ ", review_reg=" + review_reg + ", w_no=" + w_no + "]";
	}
}
