package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.FurnitureInteriorVo;

@Repository
public class FurnitureDaoImpl implements FurnitureDao {

	private static final String NAMESPACE="com.kh.team.furnitureInterior.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<FurnitureInteriorVo> getFurnitureInteriorList() throws Exception {
		List<FurnitureInteriorVo> list = sqlSession.selectList(NAMESPACE + "getFurnitureInteriorList"); 
		return list;
	}

	@Override
	public List<FurnitureInteriorVo> getFurnitureInteriorAddList(int num) throws Exception {
		List<FurnitureInteriorVo> list = sqlSession.selectList(NAMESPACE + "getFurnitureInteriorAddList", num);
		return list;
	}
	
	

}
