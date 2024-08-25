package com.kh.team.service;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;

public interface BuyComputerService {
	//컴퓨터 제품 장바구니에 넣기
	public void putBasketCategory(CartVo cartVo) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오는 기능
	public int getPurchasePercentage(BuyComputerVo buyComputerVo, int purchase_num_plus, String nok) throws Exception;
	//전체 구매상품 갯수 가져오기
	public int getTotalNum(String nok) throws Exception;
	//선택상품 구매갯수 가져오기
	public int getProductNum(int c_com_no) throws Exception;
	
	
	//결제시 구매후기 작성하는 기능
	public void insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception;
}
