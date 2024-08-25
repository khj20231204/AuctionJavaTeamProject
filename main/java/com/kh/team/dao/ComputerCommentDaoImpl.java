package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

@Repository
public class ComputerCommentDaoImpl implements ComputerCommentDao {

	//알맞은 맵퍼를 찾기위한 상수 지정
	private final String NAMESPACE = "com.kh.team.computerscomment.";
	
	//인젝
	@Inject
	private SqlSession sqlSession;

	//구매후기 리스트 가져오기
	@Override
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception {
		//구매후기 리스트 가져오기
		List<ComputerCommentVo> list = sqlSession.selectList(NAMESPACE + "getComptersCommentList", p_no);
		return list;
	}

	//상품문의 리스트 가져오기
	@Override
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception {
		//상품문의 리스트 가져오기
		List<ProductExplainVo> list = sqlSession.selectList(NAMESPACE + "getInquireList", p_no);
		return list;
	}

	//구매후기 수정하기
	@Override
	public int changeCommentContent(int c_com_comment_no,String c_com_comment_content) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_comment_no", c_com_comment_no);
		map.put("c_com_comment_content", c_com_comment_content);
		//구매후기 수정하기
		int count = sqlSession.update(NAMESPACE + "updateCommentContent", map);
		
		return count;
	}

	//구매후기 삭제하기
	@Override
	public void deleteComment(int c_com_comment_no) throws Exception {
		//구매후기 삭제하기
		sqlSession.delete(NAMESPACE + "deleteComment", c_com_comment_no);		
	}

	//상품문의 기입하기
	@Override
	public void insetInquire(ProductExplainVo productExplainVo) throws Exception {
		//상품문의 기입하기
		sqlSession.insert(NAMESPACE + "insetInquire", productExplainVo);		
	}

	//상품문의 리스트 가져오기
	@Override
	public List<ProductExplainVo> searchInquire(ProductExplainVo productExplainVo) throws Exception {
		//상품문의 리스트 가져오기
		List<ProductExplainVo> list = sqlSession.selectList(NAMESPACE + "searchInquire", productExplainVo);
		return list;
	}

	//상품문의 답변하기
	@Override
	public int explainRefContent(int p_e_no, String ref_content) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_e_no", p_e_no);
		map.put("p_e_re", ref_content);
		//상품문의 답변하기
		int count = sqlSession.update(NAMESPACE + "explainRefContent", map);
		return count;
	}
	
}
