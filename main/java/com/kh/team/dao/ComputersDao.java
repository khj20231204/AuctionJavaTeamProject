package com.kh.team.dao;

import java.util.List;


import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.ProductExplainVo;




public interface ComputersDao {
	//컴퓨터 제품 리스트
	public List<ComputerVo> list(String cate_no) throws Exception;
	//컴퓨터 제품 리스트 체크박스이용
	public List<ComputerVo> listArray(String[] checkList) throws Exception;
	//컴퓨터 결과내 검색
	public List<ComputerVo> listSearch(String c_com_name, String[] confirmList) throws Exception;
	//컴퓨터 결과내 가격대 검색
	public List<ComputerVo> listSearchPrice(int firstPrice, int lastPrice, String[] confirmList) throws Exception;
	
	//컴퓨터 결과내 판매자 아이디를 통한 검색
	public List<ComputerVo> listSearchById(String c_com_seller, String[] confirmList) throws Exception;
	//컴퓨터 결과내 판매자 아이디를 통한 검색을 할때 아이디가 있는지 확인
	public int getSearchById(String c_com_seller) throws Exception;
	
	//구매하기 폼에 카테고리 정보 구현
	public String[] buyCategoryInfoGet(String c_com_cate_no) throws Exception;
	//카테고리 정보
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception;
	
	//카테고리 정보 체크박스 이용
	public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception;
	
	//컴퓨터 제품 상세정보
	public ComputerVo detailComputerInfo(int p_no) throws Exception;
	//컴퓨터 제품 구매 폼
	public ComputerVo buyComputerProduct(int p_no) throws Exception;
	//컴퓨터 제품 구매 폼 구매후기 갯수 보여주기
	public int buyComputerComment(String c_com_product) throws Exception;
	//컴퓨터 제품 구매 폼 상품문의 갯수 보여주기
	public int buyComputerExplain(String c_com_product) throws Exception;	
}
