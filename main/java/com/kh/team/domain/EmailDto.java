package com.kh.team.domain;

public class EmailDto {
	
	private String from = "jjh9000507jjh@gmail.com"; // 보내는 이메일 주소
	private String to; // 받는 이메일 주소
	private String subject; //제목
	private String content; //내용
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "EmailDto [from=" + from + ", to=" + to + ", subject=" + subject + ", content=" + content + "]";
	}
	
}
