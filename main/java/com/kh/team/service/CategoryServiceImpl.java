package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.CartDao;
import com.kh.team.dao.CategoryDao;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	private CategoryDao categoryDao;

	@Override
	public List<CategoryVo> categoryList() throws Exception {
		List<CategoryVo> list = categoryDao.categoryList();
		return list;
	}

	@Override
	public List<List<CategoryVo>> categorySubList() throws Exception {
		List<List<CategoryVo>> list = categoryDao.categorySubList();
		return list;
	}
	
	
}
