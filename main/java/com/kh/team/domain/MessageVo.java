package com.kh.team.domain;

import java.sql.Timestamp;

public class MessageVo {
	private int msg_no;
	private String msg_sender;
	private String msg_receiver;
	private String msg_productName;
	private String msg_content;
	private Timestamp msg_sendDate;
	private Timestamp msg_readDate;
	
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	public String getMsg_productName() {
		return msg_productName;
	}
	public void setMsg_productName(String msg_productName) {
		this.msg_productName = msg_productName;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Timestamp getMsg_sendDate() {
		return msg_sendDate;
	}
	public void setMsg_sendDate(Timestamp msg_sendDate) {
		this.msg_sendDate = msg_sendDate;
	}
	public Timestamp getMsg_readDate() {
		return msg_readDate;
	}
	public void setMsg_readDate(Timestamp msg_readDate) {
		this.msg_readDate = msg_readDate;
	}
	
	@Override
	public String toString() {
		return "MessageVo [msg_no=" + msg_no + ", msg_sender=" + msg_sender + ", msg_receiver=" + msg_receiver
				+ ", msg_productName=" + msg_productName + ", msg_content=" + msg_content + ", msg_sendDate="
				+ msg_sendDate + ", msg_readDate=" + msg_readDate + "]";
	}
	
	
}
