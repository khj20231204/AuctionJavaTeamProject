package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.ClothesDao;
import com.kh.team.domain.ClothesVo;
import com.kh.team.domain.ProductVo;

@Service
public class ClothesServiceImpl implements ClothesService {

	@Inject
	private ClothesDao clothesDao;
	
	@Override
	public List<ProductVo> getClothesList(String cate_no) throws Exception {
		List<ProductVo> getClothesList = clothesDao.getClothesList(cate_no);
		return getClothesList;
	}

	@Override
	public void insertClothes(ClothesVo clothesVo) throws Exception {
		clothesDao.insertClothes(clothesVo);
	}

	@Override
	public void updateClothes(ClothesVo clothesVo) throws Exception {
		clothesDao.updateClothes(clothesVo);
	}

	@Override
	public void deleteClothes(int p_no, String p_seller) throws Exception {
		clothesDao.deleteClothes(p_no, p_seller);
	}

	@Override
	public List<ProductVo> maleClothes_List() throws Exception {
		List<ProductVo> list = clothesDao.maleClothes_List();
		return list;
	}

}
