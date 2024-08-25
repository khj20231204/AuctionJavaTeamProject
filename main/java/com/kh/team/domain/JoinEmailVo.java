package com.kh.team.domain;

public class JoinEmailVo {
	
	private String email;
	private String checkid;
	private String status;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCheckid() {
		return checkid;
	}
	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "JoinEmailVo [email=" + email + ", checkid=" + checkid + ", status=" + status + "]";
	}
	
	
}
