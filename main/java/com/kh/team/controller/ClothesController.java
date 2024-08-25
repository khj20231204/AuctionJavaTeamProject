package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.service.CategoryService;
import com.kh.team.service.ClothesService;

@Controller
@RequestMapping("/clothes")
public class ClothesController {
	
	@Inject
	ClothesService clothesSerive;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(value="/101" , method=RequestMethod.GET)
	public String maleClothes(Model model, String cate_no) throws Exception {
		System.out.println("ok");
		System.out.println("cate_no : " + cate_no);
		
		// 남성의류 상품 모두 받아오기
		List<ProductVo> list = clothesSerive.getClothesList(cate_no);
		model.addAttribute("list" , list);
		
		// 메인 카테고리 
		List<CategoryVo> mainCategory = categoryService.categoryList();
		model.addAttribute("mainCategory" , mainCategory);
		
		// 서브 카테고리
		List<List<CategoryVo>> subCategory = categoryService.categorySubList();
		model.addAttribute("subCategory" , subCategory);
		System.out.println(subCategory);
		return "/clothes/maleClothes";
	}
	
	@RequestMapping(value="/102" , method=RequestMethod.GET)
	public String feMaleClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/feMaleClothes";
	}
	
	@RequestMapping(value="/103" , method=RequestMethod.GET)
	public String publicClothes() throws Exception {
		System.out.println("ok");
		return "/clothes/publicClothes";
	}
	
//	@RequestMapping(value="/maleCategory" , method=RequestMethod.GET)
//	public String subCategory_Link(String cate_no) throws Exception {
//		System.out.println("cate_no : " + cate_no);
//		return "/clothes/maleClothes";
//	}
	
}
