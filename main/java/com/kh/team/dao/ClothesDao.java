package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ClothesVo;
import com.kh.team.domain.ProductVo;

public interface ClothesDao {
	
	public List<ProductVo> getClothesList(String cate_no) throws Exception;
	
	public void insertClothes(ClothesVo clothesVo) throws Exception;
	public void updateClothes(ClothesVo clothesVo) throws Exception;
	public void deleteClothes(int p_no, String p_seller) throws Exception;
	
	// 옷 리스트 받아오기
	public List<ProductVo> maleClothes_List() throws Exception;
	
	
}
