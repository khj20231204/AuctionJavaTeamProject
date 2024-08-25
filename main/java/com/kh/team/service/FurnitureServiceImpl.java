package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.FurnitureDao;
import com.kh.team.domain.FurnitureInteriorVo;

@Service
public class FurnitureServiceImpl implements FurnitureService {

	@Inject
	private FurnitureDao furnitureDao;
	
	@Override
	public List<FurnitureInteriorVo> getFurnitureInteriorList() throws Exception {
		List<FurnitureInteriorVo> list = furnitureDao.getFurnitureInteriorList();
		return list;
	}

	@Override
	public List<FurnitureInteriorVo> getFurnitureInteriorAddList(int num) throws Exception {
		List<FurnitureInteriorVo> list = furnitureDao.getFurnitureInteriorAddList(num);
		return list;
	}

}
