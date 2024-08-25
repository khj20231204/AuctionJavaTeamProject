package com.kh.team.domain;

public class CategoryVo {
	private String cate_no;
	private String cate_name;
	private String cate_ref;
	
	
	public String getCate_no() {
		return cate_no;
	}


	public void setCate_no(String cate_no) {
		this.cate_no = cate_no;
	}


	public String getCate_name() {
		return cate_name;
	}


	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}


	public String getCate_ref() {
		return cate_ref;
	}


	public void setCate_ref(String cate_ref) {
		this.cate_ref = cate_ref;
	}


	@Override
	public String toString() {
		return "CategoryVo [cate_no=" + cate_no + ", cate_name=" + cate_name + ", cate_ref=" + cate_ref + "]";
	}
}
