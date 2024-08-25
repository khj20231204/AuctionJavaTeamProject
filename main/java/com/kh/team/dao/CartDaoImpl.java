package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CartVo;
import com.kh.team.domain.ProductVo;

@Repository
public class CartDaoImpl implements CartDao {

	private static final String NAMESPACE = "com.kh.team.cart.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CartVo> cartList(String m_id) throws Exception {
		List<CartVo> cartList = sqlSession.selectList(NAMESPACE + "cartList", m_id);
		return cartList;
	}

	@Override
	public List<ProductVo> productList() throws Exception {
		List<ProductVo> productList = sqlSession.selectList(NAMESPACE + "productList");
		return productList;
	}

	@Override
	public void cartInput(CartVo cartVo) throws Exception {
		sqlSession.insert(NAMESPACE + "cart_input", cartVo);
	}

	@Override
	public void cartOutput(int cart_no) throws Exception {
		sqlSession.delete(NAMESPACE + "cate_output", cart_no);
	}

	@Override
	public CartVo searchCart(int p_no, String m_id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("m_id", m_id);
		
		CartVo searchCart = sqlSession.selectOne(NAMESPACE + "searchCart", map);
		return searchCart;
	}

	@Override
	public int getP_no(int cart_no) throws Exception {
		int getP_no = sqlSession.selectOne(NAMESPACE + "getP_no", cart_no);
		return getP_no;
	}

	@Override
	public ProductVo getProduct(int p_no) throws Exception {
		ProductVo getProduct = sqlSession.selectOne(NAMESPACE + "getProduct", p_no);
		return getProduct;
	}

}
