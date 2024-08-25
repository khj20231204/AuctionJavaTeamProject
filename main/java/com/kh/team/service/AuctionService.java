package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionBidVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionFavoriteVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionOrderVo;
import com.kh.team.domain.AuctionPnoFromTempBiding;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionSDateVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;

public interface AuctionService {

	//main에서 보여주는 최근파일과 메인 이미지
	public List<AuctionSellVo> getAuctoionMainList() throws Exception;
	
	//현재 입찰중인 상품
	public List<AuctionSellVo> getAuctionBidingList(String m_id, AuctionDateAndTimeVo auctionDandTVo) throws Exception;
	//입찰 종료된 상품
	public List<AuctionSellVo> getAuctionBidingFinishList(String m_id, AuctionDateAndTimeVo auctionDandTVo) throws Exception;
	//거래된 상품
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception;
	
	//내가 입찰 한 상품 : 타이틀 밑으로 입찰 항목을 보이기 위해선 테이블을 각각 가져와야 한다
	public List<AuctionTempBidVo> getAuctionPurchaserTempBiding(String m_id) throws Exception;
	//임시테이블에 p_no 만 가져와서 auction과 auction_main_img에 뿌려준다
	public List<AuctionPnoFromTempBiding> getAuctionPurchaserTmepBidingPno(String m_id) throws Exception;
	//해당 p_no의 타이틀만 가져온다
	public List<AuctionVo> getAuctionPurchaserTempBidingTitle(List<AuctionPnoFromTempBiding> tempPno) throws Exception;
	//해당 p_no의 이미지만 가져온다
	public List<AuctionMainImgVo> getAuctionPurchaserTempBidingImg(List<AuctionPnoFromTempBiding> tempPno) throws Exception;
	
	//내가 구매한 상품
	public List<AuctionSoldVo> getAuctionPurchaserList(String m_id) throws Exception;
	//수정할 상품 가져오기
	public AuctionSellVo getAuctionModifyList(int p_no) throws Exception;	
	//수정에서 선택된 p_no의 이미지
	public List<String> getAuctionImgModify(int p_no) throws Exception;
	
	//main이미지 가져오기
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception;
	//모든 이미지 가죠오기
	public List<AuctionImgVo> getAuctionImg() throws Exception;
	
	//seq_auction_pno 현재값 받아서 상품 등록시 폴더명으로 사용
	public int getNextSeqNumber() throws Exception;
	
	public AuctionSellVo getAuctionSelectedItem(int p_no) throws Exception;
	public List<AuctionImgVo> getAuctionSelectedImg(int p_no) throws Exception;
	
	//임시 입찰 가져오기
	public List<AuctionTempBidVo> getAuctionTempBid(int p_no) throws Exception;
	//입찰 가져오기
	public AuctionBidVo getAuctionBid(int p_no) throws Exception;
	//임시 입찰에서 제일 큰수
	public int getAuctionTempBidMaxPrice(int p_no) throws Exception;
	//입찰자 수
	public int getAuctionCountBid(int p_no) throws Exception;
	//입찰 현황 입력
	public void insertAuctionTempBid(AuctionTempBidVo tempBidVo) throws Exception;
	
	//종료일 가져오기
	public AuctionEDateVo getAuctionExpirationDate(int p_no) throws Exception;
	//마감일이 지나면 deadline를 Y롤
	public void updateAuctionExpriationDeadline(int p_no) throws Exception;
			
	
	//마감 기한 5분연장
	public void updateAuctionEDate(AuctionEDateVo auctionEDateVo) throws Exception;
	//자동 bid일 때 가장 큰 price가져오기
	public AuctionTempBidVo getTempBidFromMaxPrice(int p_no) throws Exception;
	//temp_bid에서 bid로 옮기기
	public void insertAutoCommitBid(int p_no) throws Exception;
	//auction데이블에 purchaser와 sold_price 업데이트
	public void updateAuctionAfterFinish(String purchaser, int sold_price, int p_no, String seller) throws Exception;

	
	public void insertAuction(AuctionVo auctionVo) throws Exception;
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception;
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception;
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception;
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception;
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception;
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception;
	
	public MemberVo AuctionLogin(String m_id, String m_pass) throws Exception;
	
	public void deleteAcutionAll(int p_no) throws Exception;
	
	public void deleteAuction_temp_bid(int p_no) throws Exception;
	public void deleteAuction_bid(int p_no) throws Exception;
	public void deleteAuction_address(int p_no) throws Exception;
	public void deleteAuction_expration_date(int p_no) throws Exception;
	public void deleteAuction_img(int p_no) throws Exception;
	public void deleteAuction_main_img(int p_no) throws Exception;
	public void deleteAuction_register_date(int p_no) throws Exception;
	public void deleteAuction_sold_date(int p_no) throws Exception;
	public void deleteAuction(int p_no) throws Exception;
	//수정할 때 x버튼을 누르면 auction_img에서 해당 파일만 삭제 
	public void modifyAuction_imgDel(String fileAllName, int p_no) throws Exception;
	// 수정할 때 이미지 한개만 넣기
	public void modifyAuction_imgInsert(String fileAllName, int p_no) throws Exception;

	//수정하기
	public void modifyAuctoin(AuctionVo auctionVo) throws Exception;
	public void modifyAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception;
	public void modifyAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception;
	public void modifyAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception;
	
	//주문하기
		//주문서에 상품 정보와 구매자 정보 가져오기
	public AuctionSoldVo orderAuctionSold(String purchaser, int p_no) throws Exception;
		//주문자 정보
	public MemberVo getMember(String m_id) throws Exception;
		//구매자 정보만 먼저 입력(주문자와 주소가 달라 질 수 있다)
	public void insertAuctionOrder(AuctionOrderVo auctionOrderVo) throws Exception;
		//구매자가 구매한 모든 항목을 가져온다
	public List<AuctionOrderVo> getAuctionOrderPurchaserList(String purchaser) throws Exception;
		//쪽지를 보내기 위해서 seller의 delivery_status가 N인거 가져오기
	public int getAuctionOrderDeliveryCount(String seller) throws Exception;
		//송장 내역 insert 하고 delivery_number를 Y로 바꾼다 : 송장번호 업데이트
	public void updateAuctionOrderDeliveryFormation(String delivery_company, String delivery_number) throws Exception;
		//판매자의 모든 배송 항목을 가져온다
	public List<AuctionOrderVo> getAuctionOrderSellerList(String seller) throws Exception;
	
	//관심상품 항목에 있는지 없는 지 체크
	public int getAuctionFavoriteCont(String m_id, int p_no) throws Exception;
	//관심상품에 삽입
	public void insertAuctionFavorite(String m_id, int p_no) throws Exception;
	//favorite테이블에 있는 p_no
	public List<AuctionSellVo> getAuctionFavoritePno(String m_id) throws Exception;
	//내 관심상품 목록
	//public List<AuctionSellVo> getAuctionFavoriteList(String m_id) throws Exception;
	//관심상품 삭제
	public void deleteAuctionFavoriet(int[] array) throws Exception;
	
	//구매확인 버튼 클릭시 purchase_confirm를 Y로
	public void updateAuctionPurchaseConfirm(int order_id) throws Exception;
	//배송 완료 버튼 클릭
	public void updateAuctionDeliveryConfirm(AuctionOrderVo orderVo) throws Exception;
}
