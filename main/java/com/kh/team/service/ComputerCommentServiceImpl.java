package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.ComputerCommentDao;
import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

@Service
public class ComputerCommentServiceImpl implements ComputerCommentService {

	//인젝
	@Inject
	private ComputerCommentDao computerCommentDao;
	
	//구매후기 리스트 가져오기
	@Override
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception {
		//구매후기 리스트 가져오기
		List<ComputerCommentVo> list = computerCommentDao.getCommentList(p_no);
		return list;				
	}

	//상품문의 리스트 가져오기
	@Override
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception {
		//상품문의 리스트 가져오기
		List<ProductExplainVo> list = computerCommentDao.getInquireList(p_no);
		return list;
	}

	//구매후기 내용 수정
	@Override
	public int changeCommentContent(int c_com_comment_no, String c_com_comment_content) throws Exception {
		//구매후기 내용 수정
		int count =computerCommentDao.changeCommentContent(c_com_comment_no, c_com_comment_content);
		return count;
	}

	//구매후기 삭제
	@Override
	public void deleteComment(int c_com_comment_no) throws Exception {
		//구매후기 삭제
		computerCommentDao.deleteComment(c_com_comment_no);		
	}

	//상품문의 기입
	@Override
	public void insetInquire(ProductExplainVo productExplainVo) throws Exception {
		//상품문의 기입
		computerCommentDao.insetInquire(productExplainVo);		
	}

	//상품문의 검색
	@Override
	public List<ProductExplainVo> searchInquire(ProductExplainVo productExplainVo) throws Exception {
		//상품문의 검색
		List<ProductExplainVo> list = computerCommentDao.searchInquire(productExplainVo);
		return list;
	}

	//상품문의 답변
	@Override
	public int explainRefContent(int p_e_no, String ref_content) throws Exception {
		//상품문의 답변
		int count = computerCommentDao.explainRefContent(p_e_no, ref_content);
		return count;
	}	
}
