package com.kh.team.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
private static final String NAMESPACE = "com.kh.team.category.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 남성의류 메인 카테고리 가져오기
	@Override
	public List<CategoryVo> categoryList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "categoryList");
	}

	// 남성의류 서브 카테고리 가져오기
	@Override
	public List<List<CategoryVo>> categorySubList() throws Exception {
		
		// 메인 카테고리 데이터 리스트에 담기
		List<CategoryVo> list = sqlSession.selectList(NAMESPACE + "categoryList");
		
		// 메인 카테고리의 cate_no 담을 리스트 생성
		List<String> cateNos = new ArrayList<String>();
		
		// 카테고리 갯수 만큼 cate_no값 vo에 저장 반복
		for (CategoryVo vo : list) {
			cateNos.add(vo.getCate_no());
		}
		
		System.out.println("cateNos:"+ cateNos);
		
		// 서브 카테고리 담을 리스트 생성
		List<List<CategoryVo>> fullList = new ArrayList<>();
		
		// cate_no 개수만큼 cate_ref 반복 저장 하여 모든 리스트 fullList에 저장
		for (String cate_ref : cateNos) {
			
			// 각각 cate_nos 값 넘겨줘서 서브 카테고리 받아오기
			List<CategoryVo> subList = sqlSession.selectList(NAMESPACE + "categorySubList", cate_ref);
			
//			System.out.println("subList:" + subList);
			
			// 모든 리스트 fullList에 저장
			fullList.add(subList);
		}
//		System.out.println("fullList:" + fullList);
		return fullList;
	}

}
