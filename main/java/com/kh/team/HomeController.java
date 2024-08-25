package com.kh.team;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.controller.ImPortKey;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.AdminService;
import com.kh.team.service.PageService;


@Controller
public class HomeController implements ImPortKey {	

	@Inject
	PageService pageService;
	
	@Inject
	AdminService adminService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session) throws Exception {
		
		List<CategoryVo> firstCategory = adminService.firstCategoryList();
		List<CategoryVo> AllCategory = adminService.getCategoryList();
		
		// 전체 상품 리스트
		List<ProductVo> selectAll_List = pageService.selectAll_List();
		
		session.setAttribute("firstCategory", firstCategory);
		session.setAttribute("AllCategory", AllCategory);
		
		session.setAttribute("selectAll_List", selectAll_List);
		
		return "/main";
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session,RedirectAttributes rttr) throws Exception {
		
		//세션 초기화
		session.removeAttribute("memberVo");
		session.removeAttribute("sendProductBoughtInfoVo");
		session.removeAttribute("nonBuyer");
		/*경매 상품 초기화*/
		session.removeAttribute("deliveryCount");
		
		//메인에서 alert창을 띄우기		
		rttr.addFlashAttribute("msg", "logoutSuccess");
		return "redirect:/";
	}

}
