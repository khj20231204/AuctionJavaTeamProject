package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

@Repository
public class PageDaoImpl implements PageDao {

	private static final String NAMESPACE = "com.kh.team.page.";
	private static final String NAMESPACE2 = "com.kh.team.map.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 상품 더 보기
	@Override
	public List<ProductVo> moreList(int startNum) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "morePage" , startNum);
		return list;
	}
	
	//검색 
	@Override
	public List<ProductVo> search(String searchName) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "search" , searchName);
//		System.out.println("Dao , list : " + list);
		return list;
	}

	// 등록한 상품 주소 받아오기
	@Override
	public List<AuctionAddressVo> addrList() throws Exception {
		List<AuctionAddressVo> list = sqlSession.selectList(NAMESPACE2 + "alterLatLng");
		return list;
	}

	// 전체 상품 리스트
	@Override
	public List<ProductVo> selectAll_List() throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "selectAll_List" );
		return list;
	}

	// 조회수 증가
	@Override
	public void updateReadCount(int p_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateReadCount" , p_no);
	}

	// 글 데이터 뿌려주기
	@Override
	public ProductVo content(int p_no) throws Exception {
		ProductVo productVo = sqlSession.selectOne(NAMESPACE + "content" , p_no);
		return productVo;
	}

	// 조회수 높은 상품 순으로 가져오기
	@Override
	public List<ProductVo> best_item() throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "best_item");
		return list;
	}

	@Override
	public List<ProductVo> sellProductData() throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE2 + "sellProductData");
		return list;
	}

}
