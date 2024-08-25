package com.kh.team.domain;

import java.sql.Timestamp;

public class NoticeVo {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_reg;
	
	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Timestamp getNotice_reg() {
		return notice_reg;
	}

	public void setNotice_reg(Timestamp notice_reg) {
		this.notice_reg = notice_reg;
	}

	@Override
	public String toString() {
		return "NoticeVo [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_reg=" + notice_reg + "]";
	}

}
