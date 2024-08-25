package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.CartDao;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.ProductVo;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDao cartDao;
	
	@Override
	public List<CartVo> cartList(String m_id) throws Exception {
		List<CartVo> cartList = cartDao.cartList(m_id);
		return cartList;
	}

	@Override
	public List<ProductVo> productList() throws Exception {
		List<ProductVo> productList = cartDao.productList();
		return productList;
	}

	@Override
	public void cartInput(CartVo cartVo) throws Exception {
		cartDao.cartInput(cartVo);
	}

	@Override
	public void cartOutput(int[] cart_no) throws Exception {
		for(int i = 0; i<cart_no.length; i++) {
			cartDao.cartOutput(cart_no[i]);
		}
	}

	@Override
	public CartVo searchCart(int p_no, String m_id) throws Exception {
		CartVo searchCart = cartDao.searchCart(p_no, m_id);
		return searchCart;
	}

	@Override
	public int getP_no(int cart_no) throws Exception {
		int getP_no = cartDao.getP_no(cart_no);
		return getP_no;
	}

	@Override
	public ProductVo getProduct(int p_no) throws Exception {
		ProductVo getProduct = cartDao.getProduct(p_no);
		return getProduct;
	}

}
