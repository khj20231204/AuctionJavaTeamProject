package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.WhitegoodsQnaVo;
import com.kh.team.domain.WhitegoodsReviewVo;
import com.kh.team.domain.WhitegoodsVo;

public interface WhitegoodsDao {
	//가전제품 리스트 가져오기
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception;
	//상품 수정
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception;
	//상품 삭제
	public void deleteWhitegoods(int w_no) throws Exception;
	//카테고리 클릭하여 상품 리스트 페이지 이동 시 해당 카테고리의 하위 카테고리 가져오기
	public List<CategoryVo> getFirstCategoryList(String cate_ref) throws Exception;
	//상품 상세보기
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception;
	//해당 유저 가전제품 전체 삭제
	public void userPAlldelete(String m_id) throws Exception;
	//상품 상세보기 시 이미지 가져오기
	public List<String> productImgList(int p_no) throws Exception;
	//상품 삭제 시 이미지 삭제
	public void productImgDelete(int p_no) throws Exception;
	//상세보기 페이지 들어갈 때마다 조회수 증가
	public void readUpdate(int w_no) throws Exception;
	//상품 수정 시 이미지 넣기
	public void imgInsert(int p_no, String img_name) throws Exception;
	
	//리뷰글 가져오기
	public List<WhitegoodsReviewVo> reviewList(int w_no) throws Exception;
	
	//상품판매자 정보를 가져오기 위해 전체 리스트 가져오기
	public MemberVo sellingMember(String m_id) throws Exception;
	
	//상품문의 글 가져오기
	public List<WhitegoodsQnaVo> getProductQna(int w_no) throws Exception;
}
