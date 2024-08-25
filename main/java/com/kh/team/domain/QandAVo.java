package com.kh.team.domain;

public class QandAVo {
	private int qa_no;
	private String qa_cate_no;
	private String q_content;
	private String a_content;
	
	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public String getQa_cate_no() {
		return qa_cate_no;
	}

	public void setQa_cate_no(String qa_cate_no) {
		this.qa_cate_no = qa_cate_no;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	@Override
	public String toString() {
		return "QandAVo [qa_no=" + qa_no + ", qa_cate_no=" + qa_cate_no + ", q_content=" + q_content + ", a_content="
				+ a_content + "]";
	}
}
