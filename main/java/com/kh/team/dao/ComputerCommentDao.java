package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

public interface ComputerCommentDao {
	//구매후기 목록
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception;
	//상품설명 목록
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception;
	//구매후기 내용 변경
	public int changeCommentContent(int c_com_comment_no, String c_com_comment_content) throws Exception;
	//구매후기 삭제
	public void deleteComment(int c_com_comment_no) throws Exception;
	//상품문의 기입
	public void insetInquire(ProductExplainVo productExplainVo) throws Exception;
	//상품문의 검색
	public List<ProductExplainVo> searchInquire(ProductExplainVo productExplainVo) throws Exception;
	
	//상품문의 답변
	public int explainRefContent(int p_e_no, String ref_content) throws Exception;
	
}
