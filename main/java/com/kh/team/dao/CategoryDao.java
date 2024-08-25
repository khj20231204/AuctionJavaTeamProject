package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;

public interface CategoryDao {

	// 남성의류 메인 카테고리 가져오기
	public List<CategoryVo> categoryList() throws Exception;
	
	// 남성의류 서브 카테고리 가져오기
	public List<List<CategoryVo>> categorySubList()  throws Exception;
}
