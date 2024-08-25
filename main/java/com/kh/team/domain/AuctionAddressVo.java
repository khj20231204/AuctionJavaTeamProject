package com.kh.team.domain;

public class AuctionAddressVo {

	private int address_no;
	private String zip;
	private String road_address;
	private String jibun_address;
	private String detail_address;
	private int p_no;
	
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionAddressVo [address_no=" + address_no + ", zip=" + zip + ", road_address=" + road_address
				+ ", jibun_address=" + jibun_address + ", detail_address=" + detail_address + ", p_no=" + p_no + "]";
	}
}
