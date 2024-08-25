package com.kh.team.domain;

public class AuctionReceiveOrderVo {
	private int order_receive_id;
	private String seller;
	private String delivery_company;
	private String delivery_number;
	private String delivery_status;
	private int p_no;
	
	public int getOrder_receive_id() {
		return order_receive_id;
	}
	public void setOrder_receive_id(int order_receive_id) {
		this.order_receive_id = order_receive_id;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getDelivery_company() {
		return delivery_company;
	}
	public void setDelivery_company(String delivery_company) {
		this.delivery_company = delivery_company;
	}
	public String getDelivery_number() {
		return delivery_number;
	}
	public void setDelivery_number(String delivery_number) {
		this.delivery_number = delivery_number;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionReceiveOrderVo [order_receive_id=" + order_receive_id + ", seller=" + seller
				+ ", delivery_company=" + delivery_company + ", delivery_number=" + delivery_number
				+ ", delivery_status=" + delivery_status + ", p_no=" + p_no + "]";
	}
}
