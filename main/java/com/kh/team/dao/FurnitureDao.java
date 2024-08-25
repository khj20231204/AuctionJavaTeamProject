package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.FurnitureInteriorVo;

public interface FurnitureDao {

	public List<FurnitureInteriorVo> getFurnitureInteriorList() throws Exception;
	
	//jsp에서 더보기 눌렀을 때 가져오는 항목 갯수가 2개씩 늘어난다
	public List<FurnitureInteriorVo> getFurnitureInteriorAddList(int num) throws Exception;
}
