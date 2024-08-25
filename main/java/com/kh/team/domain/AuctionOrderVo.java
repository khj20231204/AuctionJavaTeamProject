package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionOrderVo {
	//구매자
	private int order_id;
	private String purchaser;
	private String orderer_name;
	private String phonenumber;
	//결제
	private Timestamp order_date;
	private String imp_uid;
	private String merchant_uid;
	private int order_price;
	private String card_approval_number;
	//배송
	private String order_msg;
	private String zip;
	private String road_address;
	private String jibun_address;
	private String detail_address;
	private String purchase_confirm;
	//판매자
	private String seller;
	private String delivery_company;
	private String delivery_number;
	private String delivery_status;
	//제품
	private String main_img_name;
	private String sold_price;
	private String p_title;
	private int p_no;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getOrderer_name() {
		return orderer_name;
	}
	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getCard_approval_number() {
		return card_approval_number;
	}
	public void setCard_approval_number(String card_approval_number) {
		this.card_approval_number = card_approval_number;
	}
	public String getPurchase_confirm() {
		return purchase_confirm;
	}
	public void setPurchase_confirm(String purchase_confirm) {
		this.purchase_confirm = purchase_confirm;
	}
	public String getOrder_msg() {
		return order_msg;
	}
	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
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
	public String getMain_img_name() {
		return main_img_name;
	}
	public void setMain_img_name(String main_img_name) {
		this.main_img_name = main_img_name;
	}
	public String getSold_price() {
		return sold_price;
	}
	public void setSold_price(String sold_price) {
		this.sold_price = sold_price;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionOrderVo [order_id=" + order_id + ", purchaser=" + purchaser + ", orderer_name=" + orderer_name
				+ ", phonenumber=" + phonenumber + ", order_date=" + order_date + ", imp_uid=" + imp_uid
				+ ", merchant_uid=" + merchant_uid + ", order_price=" + order_price + ", card_approval_number="
				+ card_approval_number + ", purchase_confirm=" + purchase_confirm + ", order_msg=" + order_msg
				+ ", zip=" + zip + ", road_address=" + road_address + ", jibun_address=" + jibun_address
				+ ", detail_address=" + detail_address + ", seller=" + seller + ", delivery_company=" + delivery_company
				+ ", delivery_number=" + delivery_number + ", delivery_status=" + delivery_status + ", main_img_name="
				+ main_img_name + ", sold_price=" + sold_price + ", p_title=" + p_title + ", p_no=" + p_no + "]";
	}
}
