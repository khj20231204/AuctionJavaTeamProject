package com.kh.team;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.CategoryDao;
import com.kh.team.domain.CategoryVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CategoryDaoTest {

	@Inject
	private CategoryDao categoryDao;
	
	@Test
	public void testCategoryList() throws Exception {
		List<CategoryVo> list = categoryDao.categoryList();
		System.out.println(list);
	}
	
	@Test
	public void testCategorySubList() throws Exception {
		List<List<CategoryVo>> list = categoryDao.categorySubList();
		System.out.println("list:" + list);
	}
	
	
	
	
}
