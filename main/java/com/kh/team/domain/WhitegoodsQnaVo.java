package com.kh.team.domain;

import java.sql.Timestamp;

public class WhitegoodsQnaVo {
	private int wqa_no;
	private int w_no;
	private String wqa_content;
	private String m_id;
	private Timestamp wqa_reg;
	
	
	public int getWqa_no() {
		return wqa_no;
	}


	public void setWqa_no(int wqa_no) {
		this.wqa_no = wqa_no;
	}


	public int getW_no() {
		return w_no;
	}


	public void setW_no(int w_no) {
		this.w_no = w_no;
	}


	public String getWqa_content() {
		return wqa_content;
	}


	public void setWqa_content(String wqa_content) {
		this.wqa_content = wqa_content;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public Timestamp getWqa_reg() {
		return wqa_reg;
	}


	public void setWqa_reg(Timestamp wqa_reg) {
		this.wqa_reg = wqa_reg;
	}


	@Override
	public String toString() {
		return "WhitegoodsQnaVo [wqa_no=" + wqa_no + ", w_no=" + w_no + ", wqa_content=" + wqa_content + ", m_id="
				+ m_id + ", wqa_reg=" + wqa_reg + "]";
	}
}
