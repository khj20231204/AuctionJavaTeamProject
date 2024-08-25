package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.WhitegoodsQnaVo;
import com.kh.team.domain.WhitegoodsReviewVo;
import com.kh.team.domain.WhitegoodsVo;

@Repository
public class WhitegoodsDaoImpl implements WhitegoodsDao {

	private static final String NAMESPACE = "com.kh.team.whitegoods.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = sqlSession.selectList(NAMESPACE + "getWhitegoodsList", w_cate_no);
		return getWhitegoodsList;
	}

	@Override
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateWhitegoods", whitegoodsVo);
	}

	@Override
	public void deleteWhitegoods(int w_no) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteWhitegoods", w_no);
	}

	@Override
	public List<CategoryVo> getFirstCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getFirstCategoryList = sqlSession.selectList(NAMESPACE + "getFirstCategoryList", cate_ref);
		return getFirstCategoryList;
	}

	@Override
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception {
		WhitegoodsVo whitegoodsVo = sqlSession.selectOne(NAMESPACE + "detailWhitegoods", w_no);
		return whitegoodsVo;
	}

	@Override
	public void userPAlldelete(String m_id) throws Exception {
		sqlSession.delete(NAMESPACE + "userPAlldelete", m_id);
		
	}

	@Override
	public List<String> productImgList(int p_no) throws Exception {
		List<String> productImgList = sqlSession.selectList(NAMESPACE + "productImgList", p_no);
		return productImgList;
	}

	@Override
	public void productImgDelete(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE + "productImgDelete", p_no);
	}

	@Override
	public void readUpdate(int w_no) throws Exception {
		sqlSession.update(NAMESPACE + "readUpdate", w_no);
	}

	@Override
	public void imgInsert(int p_no, String img_name) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("img_name", img_name);
		sqlSession.insert(NAMESPACE + "productImage", map);
	}

	@Override
	public List<WhitegoodsReviewVo> reviewList(int w_no) throws Exception {
		List<WhitegoodsReviewVo> reviewList = sqlSession.selectList(NAMESPACE + "reviewList", w_no);
		return reviewList;
	}

	@Override
	public MemberVo sellingMember(String m_id) throws Exception {
		MemberVo sellingMember = sqlSession.selectOne(NAMESPACE + "sellingMember", m_id);
		return sellingMember;
	}

	@Override
	public List<WhitegoodsQnaVo> getProductQna(int w_no) throws Exception {
		List<WhitegoodsQnaVo> getProductQna = sqlSession.selectList(NAMESPACE + "getProductQna", w_no);
		return getProductQna;
	}

	

}
