package com.kh.team.domain;

import java.util.Arrays;

public class ProductImgVo {
	private int img_no;
	private int p_no;
	private String[] img_name;
	
	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String[] getImg_name() {
		return img_name;
	}

	public void setImg_name(String[] img_name) {
		this.img_name = img_name;
	}

	@Override
	public String toString() {
		return "ProductImgVo [img_no=" + img_no + ", p_no=" + p_no + ", img_name=" + Arrays.toString(img_name) + "]";
	}

}
