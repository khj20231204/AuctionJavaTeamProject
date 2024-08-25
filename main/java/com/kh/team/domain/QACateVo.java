package com.kh.team.domain;

public class QACateVo {
	private String qa_cate_no;
	private String qa_cate_name;
	private String qa_cate_ref;
	
	public String getQa_cate_no() {
		return qa_cate_no;
	}

	public void setQa_cate_no(String qa_cate_no) {
		this.qa_cate_no = qa_cate_no;
	}

	public String getQa_cate_name() {
		return qa_cate_name;
	}

	public void setQa_cate_name(String qa_cate_name) {
		this.qa_cate_name = qa_cate_name;
	}

	public String getQa_cate_ref() {
		return qa_cate_ref;
	}

	public void setQa_cate_ref(String qa_cate_ref) {
		this.qa_cate_ref = qa_cate_ref;
	}

	@Override
	public String toString() {
		return "QACateVo [qa_cate_no=" + qa_cate_no + ", qa_cate_name=" + qa_cate_name + ", qa_cate_ref=" + qa_cate_ref
				+ "]";
	}
}
