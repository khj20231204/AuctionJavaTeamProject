package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.BuyComputerDao;
import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;

@Service
public class BuyComputerServiceImpl implements BuyComputerService {
	//인덱스
	private int CHECK_FOR_INDEX = 0;
	
	//인젝
	@Inject
	private BuyComputerDao buyComputerDao;
	
	//카테고리에 넣기
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		//카테고리에 넣기
		buyComputerDao.putBasketCategory(cartVo);		
	}

	//구매율 보여주기
	@Override
	public int getPurchasePercentage(BuyComputerVo buyComputerVo, int purchase_num_plus, String nok) throws Exception {
		//해당 제품의 구매율이 저장된 테이블의 pk값 가져오기
		int c_com_no = buyComputerDao.getPkForTakePurchasePercentage(buyComputerVo);
		System.out.println("c_com_no:" + c_com_no);
		int check_no = CHECK_FOR_INDEX;
		//해당 제품의 구매율이 저장된 테이블이 존재하는지 확인
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no:" + check_no);
		if(check_no == 0) {
			//해당 제품의 구매율이 저장된 테이블이 존재하는지 않는다면 테이블생성
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재");
		}	
		//해당 제품의 구매율이 저장된 테이블의 구매율 가져오기
		int purchase_num = buyComputerDao.selectNumForGetPurchasePercentage(c_com_no);
		System.out.println("purchase_num:" + purchase_num);
		//해당 제품의 구매율이 저장된 테이블의 구매율 증가시키기
		int count = buyComputerDao.updateNumForGetPurchasePercentage(c_com_no, purchase_num, purchase_num_plus);
		System.out.println("count:" + count);
		//총 제품의 구매율이 저장된 테이블의 구매율 합계 가져오기
		int select_number = buyComputerDao.selectTotalTable(nok);
		System.out.println("select_number:" + select_number);
		//총 제품의 구매율이 저장된 테이블의 구매율 합계 증가시키기
		int countRe = buyComputerDao.updateTotalNumPlus(nok, purchase_num_plus, select_number);
		System.out.println("countRe:" + countRe);
		
		return count;
		
	}

	//구매율 값의 합계가 있는 테이블에서 구매율 합계 가져오기
	@Override
	public int getTotalNum(String nok) throws Exception {
		//구매율 값의 합계가 있는 테이블에서 구매율 합계 가져오기
		int select_number = buyComputerDao.selectTotalTable(nok);
		return select_number;
	}

	//해당 제품 구매율 가져오기
	@Override
	public int getProductNum(int c_com_no) throws Exception {
		int check_no = CHECK_FOR_INDEX;
		//해당 제품의 구매율이 저장된 테이블의 pk값 가져오기
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no:" + check_no);
		if(check_no == 0) {
			//해당 제품의 구매율이 저장된 테이블이 존재하는지 않는다면 테이블생성
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재");
		}	
		int productNum = 0;
		//해당 제품의 구매율이 저장된 테이블의 구매율 가져오기
		productNum = buyComputerDao.selectNumForGetPurchasePercentage(c_com_no);
		return productNum;
	}

	//구매후기 작성하기
	@Override
	public void insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception {
		//구매후기 작성하기
		buyComputerDao.insertProductRef(productName, m_id, c_com_comment_content);
		
	}

	
}
