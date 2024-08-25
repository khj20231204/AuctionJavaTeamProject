package com.kh.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.AuctionService;
import com.kh.team.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartContoller {

	@Inject
	private CartService cartService;
	
	@Inject
	private AuctionService auctionService;
	
	//장바구니 페이지
	@RequestMapping(value="/cartPage", method=RequestMethod.GET)
	public String cartPage(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		List<CartVo> cartList = cartService.cartList(m_id);
		List<ProductVo> productList = cartService.productList();
		model.addAttribute("cartList", cartList);
		model.addAttribute("productList", productList);
		
		//경매 시작
		AuctionController ac = new AuctionController();
		ac.setAuctionService(auctionService);
		ac.makeImgDirectoryAfterCheck();
		
		List<AuctionSellVo> auctionSellVo = auctionService.getAuctionFavoritePno(m_id);
		System.out.println("controller auctionSellVo:"+auctionSellVo);
		model.addAttribute("auctionList", auctionSellVo);
		//경매 끝
		return "/cart/cartPage";
	}
	
	//장바구니 삭제
	@RequestMapping(value="/cartDelete", method=RequestMethod.GET)
	@ResponseBody
	public String cartDelete(int[] cart_no) throws Exception{
		cartService.cartOutput(cart_no);
		return "success";
	}
	
	//장바구니 담기
	@RequestMapping(value="/cartInput", method=RequestMethod.GET)
	@ResponseBody
	public String cartInput(int p_no, HttpSession session) throws Exception {
		CartVo cartVo = new CartVo();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String msg = null;
		String m_id = memberVo.getM_id();
		
		CartVo searchCart = cartService.searchCart(p_no, m_id);;
		if(searchCart == null) {
			cartVo.setM_id(m_id);
			cartVo.setP_no(p_no);
			cartService.cartInput(cartVo);
			msg = "success";
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	//여러개 선택 장바구니 삭제
	@RequestMapping(value="/cartListDelete", method=RequestMethod.POST)
	public String cartListDelete(int[] cart_no, String type, RedirectAttributes rttr) throws Exception{
//		for(int i = 0; i<cart_no.length; i++) {
//			System.out.println("cart_no: " + cart_no[i]);
//		}
		cartService.cartOutput(cart_no);
		rttr.addFlashAttribute("msg", "successDelete");
		return "redirect:/cart/cartPage";
	}
	
	//상품 구매
	@RequestMapping(value="/purchase", method=RequestMethod.POST)
	public String cartListBuy(int[] cart_no, String type, Model model) throws Exception{
		List<ProductVo> productList = new ArrayList<>();
		for(int i = 0; i<cart_no.length; i++) {
			int p_no = cartService.getP_no(cart_no[i]);
			ProductVo productVo = cartService.getProduct(p_no);
			productList.add(productVo);
		}
		System.out.println("productList: " + productList);
		model.addAttribute("productList", productList);
		return "/cart/purchaseForm";
	}
}
