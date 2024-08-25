package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

public interface PageDao {
	
	// 더보기 버튼
	public List<ProductVo> moreList(int startNum) throws Exception;
	
	// 검색 
	public List<ProductVo> search(String searchName) throws Exception;
	
	// 등록한 상품 주소 받아오기
	public List<AuctionAddressVo> addrList() throws Exception;
	
	// 전체 상품 리스트
	public List<ProductVo> selectAll_List() throws Exception;
	
	// 조회수 증가(베스트)
	public void updateReadCount(int p_no) throws Exception;
	
	// 글 데이터 받아오기
	public ProductVo content(int p_no) throws Exception;
	
	// 조회수 높은 순으로 상품 불러오기(best 12개)
	public List<ProductVo> best_item() throws Exception;
	
	// 등록한 상품 주소 및 데이터 받아오기
	public List<ProductVo> sellProductData() throws Exception;
	
}
