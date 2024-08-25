package com.kh.team.controller;

import javax.inject.Inject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.SendProductBoughtInfoVo;
import com.kh.team.service.BuyComputerService;
import com.kh.team.service.MemberService;

@Controller
@RequestMapping("/buyComputerProduct")
public class BuyComputerProductController {
	//인덱스	
	private int CHECK_FOR_INDEX = 1;
	//인젝
	@Inject
	private BuyComputerService buyComputerService;
	//인젝
	@Inject
	private MemberService memberService;
	
	//구매하기 창 열기
	@RequestMapping(value="/openBuyComputerProductDetail", method=RequestMethod.POST)
	public String openBuyComputerProductDetail(BuyComputerVo buyComputerVo, HttpServletRequest request) throws Exception{
		System.out.println("/openBuyComputerProductDetail");
		System.out.println("buyComputerVo:" + buyComputerVo);
		String m_id = buyComputerVo.getM_id();
		//포인트 가져오기
		int m_point = memberService.getMemberPoint(m_id);
		request.setAttribute("buyComputerInfo", buyComputerVo);	
		request.setAttribute("m_point", m_point);	
		return "/computerProduct/buyComputerProductDetail";				
	}
	
	//장바구니에 넣기
	@RequestMapping(value="/putBasketProduct", method=RequestMethod.POST)
	@ResponseBody
	public String putBasketProduct(CartVo cartVo) throws Exception{
		System.out.println("/putBasketProduct");
		System.out.println("cartVo:" + cartVo);
		buyComputerService.putBasketCategory(cartVo);		
		
		return "success";				
	}
	
	//구매율을 반영하기
	@RequestMapping(value="/sendForGetPurchasePercentage", method=RequestMethod.POST)
	@ResponseBody
	public String sendForGetPurchasePercentage(BuyComputerVo buyComputerVo) throws Exception{
		System.out.println("buyComputerVo:" + buyComputerVo);
		int purchase_num_plus = buyComputerVo.getProductNum();
		
		String nok = "nok";
		
		//구매율 가져오기
		int count = buyComputerService.getPurchasePercentage(buyComputerVo, purchase_num_plus, nok);
		String view = "";
		if(count == CHECK_FOR_INDEX) {
			view = "success";
		}else {
			view = "fail";
		}
		return view;		
	}
	
	//구매자 이름 바꾸기
	@RequestMapping(value="/changeBuyerName", method=RequestMethod.POST)
	@ResponseBody
	public String changeBuyerName(String buyerName, String m_id, String m_pass) throws Exception{
		System.out.println("buyerName:" + buyerName);
		System.out.println("m_id_buy_form:" + m_id);
		System.out.println("m_pass_confirm:" + m_pass);
		
		//구매자 이름 바꾸기
		int count = memberService.changeNameByCallProduct(buyerName, m_id, m_pass);
		
		String resultValue = "";
		
		if(count == CHECK_FOR_INDEX) {
			resultValue = "success";
		}else {
			resultValue = "fail";
		}
		
		return resultValue;		
	}
	
	//결제하기
	@RequestMapping(value="/sendProductInfoBought", method=RequestMethod.POST)
	@ResponseBody
	public String sendProductInfoBought(SendProductBoughtInfoVo sendProductBoughtInfoVo,HttpSession session, RedirectAttributes rttr, HttpServletResponse response,HttpServletRequest request) throws Exception{
		System.out.println("sendProductBoughtInfoVo:" + sendProductBoughtInfoVo);
		//개인정보 창에서 가져올 때 쓰기
		session.setAttribute("sendProductBoughtInfoVo", sendProductBoughtInfoVo);
		String productName = sendProductBoughtInfoVo.getProductName();
		System.out.println("productName:" + productName);
		String show = "fail";
		
		int totalPrice = sendProductBoughtInfoVo.getPrice();
		System.out.println("totalPrice:" + totalPrice);
		
		//가격을 포인트로 변환하기
		int totalPoint = totalPrice / 100;
		System.out.println("totalPoint:" + totalPoint);		
		
		String m_id = sendProductBoughtInfoVo.getM_id();
		System.out.println("m_id:" + m_id);
		
		//포인트 더하기
		int count = memberService.increaseMemberPoint(totalPoint, m_id);
		System.out.println("count:" + count);
		
		if(count == 1) {
			show = String.valueOf(totalPoint);
		}else {
			System.out.println("포인트 더하기 안됨");
		}		
				System.out.println("cookie_null");
				//쿠키 생성
				Cookie cookiePNA = new Cookie("productAName", productName);
				
				//쿠키 시간 설정
				cookiePNA.setMaxAge(3 * 60);
				cookiePNA.setPath("/");					
				//쿠키 더하기
				response.addCookie(cookiePNA);
				
			
		
		System.out.println("end");
		return show;				
	}
	
	//구매후기 추가
	@RequestMapping(value="/insertProductRef", method=RequestMethod.POST)
	@ResponseBody
	public String insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception{
		System.out.println("productName:" + productName);
		System.out.println("m_id:" + m_id);
		System.out.println("c_com_comment_content:" + c_com_comment_content);
		//구매후기 추가
		buyComputerService.insertProductRef(productName, m_id, c_com_comment_content);
		return "success";				
	}
}
