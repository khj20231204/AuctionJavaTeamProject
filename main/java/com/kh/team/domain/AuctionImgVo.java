package com.kh.team.domain;

import java.util.Arrays;

public class AuctionImgVo {
	private int img_no;
	private String img_name;
	private String main_img_status;
	private int p_no;
	
	private String[] images;

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getMain_img_status() {
		return main_img_status;
	}

	public void setMain_img_status(String main_img_status) {
		this.main_img_status = main_img_status;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String[] getImages() {
		return images;
	}

	public void setImages(String[] images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "AuctionImgVo [img_no=" + img_no + ", img_name=" + img_name + ", main_img_status=" + main_img_status
				+ ", p_no=" + p_no + ", images=" + Arrays.toString(images) + "]";
	}
}
