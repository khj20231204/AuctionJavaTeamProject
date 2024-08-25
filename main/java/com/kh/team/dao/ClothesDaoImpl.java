package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ClothesVo;
import com.kh.team.domain.ProductVo;

@Repository
public class ClothesDaoImpl implements ClothesDao {

	private static final String NAMESPACE = "com.kh.team.clothes.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVo> getClothesList(String cate_no) throws Exception {
		List<ProductVo> getClothesList = sqlSession.selectList(NAMESPACE + "getClothesList", cate_no);
		return getClothesList;
	}

	@Override
	public void insertClothes(ClothesVo clothesVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertClothes", clothesVo);

	}

	@Override
	public void updateClothes(ClothesVo clothesVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateClothes", clothesVo);

	}

	@Override
	public void deleteClothes(int p_no, String p_seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("p_seller", p_seller);
		
		sqlSession.delete(NAMESPACE + "deleteClothes", map);

	}

	@Override
	public List<ProductVo> maleClothes_List() throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "maleClothes_List" );
		return list;
	}


}
