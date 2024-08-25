package com.kh.team.domain;

public class SendProductBoughtInfoVo {
	private int price; //결제 가격
	private String seller; //판매자
	private int productNum; //상품갯수
	private String productName; //상품명
	private String sendMethod; //배송방법
	private int p_no; //pk(결제한 상품 제품 구분용)
	private String radioVal; //결제방법
	private int memberOfTelephone; //구매자 휴대폰번호
	private String messageForDriver; //배송기사에게 남길 말
	private int postcode; //우편번호
	private String roadAddress; //도로명 주소
	private String extraAddress; //기타 주소		
	private String detailAddress; //상세 주소
	private String m_id; //구매자 아이디
	private int todayValueYear; //구매년도
	private int todayValueMonth; //구매한 달
	private int todayValueDate; //구매한 날짜
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSendMethod() {
		return sendMethod;
	}
	public void setSendMethod(String sendMethod) {
		this.sendMethod = sendMethod;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getRadioVal() {
		return radioVal;
	}
	public void setRadioVal(String radioVal) {
		this.radioVal = radioVal;
	}
	public int getMemberOfTelephone() {
		return memberOfTelephone;
	}
	public void setMemberOfTelephone(int memberOfTelephone) {
		this.memberOfTelephone = memberOfTelephone;
	}
	public String getMessageForDriver() {
		return messageForDriver;
	}
	public void setMessageForDriver(String messageForDriver) {
		this.messageForDriver = messageForDriver;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getTodayValueYear() {
		return todayValueYear;
	}
	public void setTodayValueYear(int todayValueYear) {
		this.todayValueYear = todayValueYear;
	}
	public int getTodayValueMonth() {
		return todayValueMonth;
	}
	public void setTodayValueMonth(int todayValueMonth) {
		this.todayValueMonth = todayValueMonth;
	}
	public int getTodayValueDate() {
		return todayValueDate;
	}
	public void setTodayValueDate(int todayValueDate) {
		this.todayValueDate = todayValueDate;
	}
	@Override
	public String toString() {
		return "SendProductBoughtInfoVo [price=" + price + ", seller=" + seller + ", productNum=" + productNum
				+ ", productName=" + productName + ", sendMethod=" + sendMethod + ", p_no=" + p_no + ", radioVal="
				+ radioVal + ", memberOfTelephone=" + memberOfTelephone + ", messageForDriver=" + messageForDriver
				+ ", postcode=" + postcode + ", roadAddress=" + roadAddress + ", extraAddress=" + extraAddress
				+ ", detailAddress=" + detailAddress + ", m_id=" + m_id + ", todayValueYear=" + todayValueYear
				+ ", todayValueMonth=" + todayValueMonth + ", todayValueDate=" + todayValueDate + "]";
	}	
	
}
