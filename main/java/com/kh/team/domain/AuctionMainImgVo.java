package com.kh.team.domain;

public class AuctionMainImgVo {
	private int main_img_no;
	private String main_img_name;
	private int p_no;
	
	public int getMain_img_no() {
		return main_img_no;
	}
	public void setMain_img_no(int main_img_no) {
		this.main_img_no = main_img_no;
	}
	public String getMain_img_name() {
		return main_img_name;
	}
	public void setMain_img_name(String main_img_name) {
		this.main_img_name = main_img_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionMainImgVo [main_img_no=" + main_img_no + ", main_img_name=" + main_img_name + ", p_no=" + p_no
				+ "]";
	}
}
