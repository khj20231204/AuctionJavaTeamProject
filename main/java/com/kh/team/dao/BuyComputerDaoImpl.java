package com.kh.team.dao;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.ComputerVo;

@Repository
public class BuyComputerDaoImpl implements BuyComputerDao {	 
	
	//알맞은 맵퍼를 찾기위한 상수 지정
	private final String NAMESPACE = "com.kh.team.buycomputerproduct.";
		
	//인젝
	@Inject
	private SqlSession sqlSession;
	
	//장바구니에 넣기
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		//장바구니에 넣기
		sqlSession.insert(NAMESPACE + "putBasketCategory", cartVo);		
	}
	
	//구매율을 구하기 위해 해당 제품 primary key가져오기
	@Override
	public int getPkForTakePurchasePercentage(BuyComputerVo buyComputerVo) throws Exception {
		//구매율을 구하기 위해 해당 제품 primary key가져오기
		ComputerVo computerVo = sqlSession.selectOne(NAMESPACE + "getComNoForPercentage", buyComputerVo);
		int c_com_no = computerVo.getC_com_no();
		return c_com_no;		
	}
	
	//구매율을 구하기 위해 구매율을 구하기 위한 테이블에 해당 제품번호를 이용하여 데이터 삽입하기
	@Override
	public void pushNumForGetPurchasePercentage(int c_com_no) throws Exception {
		//구매율을 구하기 위해 구매율을 구하기 위한 테이블에 해당 제품번호를 이용하여 데이터 삽입하기
		sqlSession.insert(NAMESPACE + "pushNumForPercentage", c_com_no);
	}
	
	//구매상품 갯수와 총 기존 구매상품 갯수를 합하기
	@Override
	public int updateNumForGetPurchasePercentage(int c_com_no, int purchase_num, int purchase_num_plus)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_no", c_com_no);
		map.put("purchase_num", purchase_num);
		map.put("purchase_num_plus", purchase_num_plus);
		//구매상품 갯수와 총 기존 구매상품 갯수를 합하기
		int count = sqlSession.update(NAMESPACE + "updateNumForPercentage", map);
		return count;
		
	}

	//해당 제품의 지금까지의 구매갯수 가져오기
	@Override
	public int selectNumForGetPurchasePercentage(int c_com_no) throws Exception {
		//해당 제품의 지금까지의 구매갯수 가져오기
		int purchase_num = sqlSession.selectOne(NAMESPACE + "selectNumForPercentage", c_com_no);
		return purchase_num;
	}

	//해당 제품의 구매정보가 있는지 확인하기
	@Override
	public int selectNumForCheck(int c_com_no) throws Exception {
		//해당 제품의 구매정보가 있는지 확인하기
		int check_no = sqlSession.selectOne(NAMESPACE + "selectNumForCheck", c_com_no);
		return check_no;
	}

	//해당 상품의 구매갯수와 총 구매상품의 갯수를 합하기
	@Override
	public int updateTotalNumPlus(String nok,int purchase_num_plus,int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("nok", nok);
		map.put("purchase_num_plus", purchase_num_plus);
		map.put("select_number", select_number);
		//해당 상품의 구매갯수와 총 구매상품의 갯수를 합하기
		int count = sqlSession.update(NAMESPACE + "updateTotalNumPlus", map);
		return count;
	}

	//구매상품 총 갯수 가져오기
	@Override
	public int selectTotalTable(String nok) throws Exception {
		//구매상품 총 갯수 가져오기
		int select_number = sqlSession.selectOne(NAMESPACE + "selectTotalTable", nok);
		return select_number;		
	}

	// -----------------------------------------------------
	
	//구매상품 선호도와 총 기존 구매상품 선호도를 합하기
	@Override
	public int updateNumForGetPurchaseLike(int c_com_no,int like_num_plus, int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_no", c_com_no);
		map.put("like_num", select_number);		
		map.put("like_num_plus", like_num_plus);		
		//구매상품 선호도와 총 기존 구매상품 선호도를 합하기
		int count = sqlSession.update(NAMESPACE + "updateNumForLike", map);
		System.out.println("updateNumForGetPurchaseLike_like_count:" + count);
		return count;
	}

	//해당 상품의 선호도 가져오기
	@Override
	public int selectNumForGetPurchaseLike(int c_com_no) throws Exception {
		//해당 상품의 선호도 가져오기
		int like_num = sqlSession.selectOne(NAMESPACE + "selectNumForLike", c_com_no);
		System.out.println("selectNumForGetPurchaseLike_like_num:" + like_num);
		return like_num;
	}

	//해당 상품의 선호도와 총 구매상품의 선호도를 합하기
	@Override
	public int updateTotalNumLikePlus(String nok,int like_num_plus, int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("nok", nok);
		map.put("select_number", select_number);		
		map.put("like_num_plus", like_num_plus);
		//해당 상품의 선호도와 총 구매상품의 선호도를 합하기
		int count = sqlSession.update(NAMESPACE + "updateTotalNumLikePlus", map);
		System.out.println("updateTotalNumLikePlus_count:" + count);
		return count;
	}

	//구매상품 총 선호도 가져오기
	@Override
	public int selectTotalTableLike(String nok) throws Exception {
		//구매상품 총 선호도 가져오기
		int totallike = sqlSession.selectOne(NAMESPACE + "selectTotalTableLike", nok);
		System.out.println("selectTotalTableLike_totallike:" + totallike);
		return totallike;
	}

	
	
	// -----------------------------------------------------
	
	//구매후기 삽입
	@Override
	public void insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("productName", productName);
		map.put("m_id", m_id);		
		map.put("c_com_comment_content", c_com_comment_content);
		//구매후기 삽입
		sqlSession.insert(NAMESPACE + "insertProductRef", map);		
	}
		
}
