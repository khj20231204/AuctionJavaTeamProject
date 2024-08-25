package com.kh.team.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.WhitegoodsQnaVo;
import com.kh.team.domain.WhitegoodsReviewVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.WhitegoodsService;
import com.kh.team.util.UploadFileUtils;

@Controller
@RequestMapping("/whitegoods")
public class WhitegoodsController {
	
	@Inject
	private WhitegoodsService whitegoodsService;
	
	//가전제품 카테고리 클릭하여 상품 전체 리스트 보기
	@RequestMapping(value="/whitegoodsPage/{w_cate_no}", method=RequestMethod.GET)
	public String WhitegoodsPage(@PathVariable("w_cate_no") String w_cate_no, Model model) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = whitegoodsService.getWhitegoodsList(w_cate_no);
		List<CategoryVo> getFirstCategoryList = whitegoodsService.getFirstCategoryList(w_cate_no);
		model.addAttribute("WhitegoodsList", getWhitegoodsList);
		model.addAttribute("firstCategoryList", getFirstCategoryList);
		return "/whitegoods/whitegoodsList";
	}
	
	//하위 카테고리 선택 시 카테고리 반환
	@RequestMapping(value="/whitegoodsCate", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getOtherCategoryList(String w_cate_no) throws Exception{
		List<CategoryVo> getOtherCategoryList = whitegoodsService.getFirstCategoryList(w_cate_no);
		return getOtherCategoryList;
	}
	
	//상품 상세보기 페이지
	@RequestMapping(value="/detailWhitegoods/{w_no}", method=RequestMethod.GET)
	public String detailWhitegoods(@PathVariable("w_no") int w_no, Model model) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		String seller = whitegoodsVo.getW_seller();
		int p_no = whitegoodsVo.getP_no();
		List<String> productImgList = whitegoodsService.productImgList(p_no);
		List<WhitegoodsReviewVo> reviewList = whitegoodsService.reviewList(w_no);
		List<WhitegoodsQnaVo> productQna = whitegoodsService.getProductQna(w_no);
		MemberVo sellingMember = whitegoodsService.sellingMember(seller);
		
		model.addAttribute("whitegoodsVo", whitegoodsVo);
		model.addAttribute("productImgList", productImgList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("sellingMember", sellingMember);
		model.addAttribute("productQna", productQna);
		return "/whitegoods/detailwhitegoods";
	}

	
	//수정하기 버튼
	@RequestMapping(value="/whitegoodsUpdate/{w_no}", method=RequestMethod.GET)
	public String whitegoodsUpdate(@PathVariable("w_no") int w_no, Model model) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		int p_no = whitegoodsVo.getP_no();
		List<String> productImgList = whitegoodsService.productImgList(p_no);
		model.addAttribute("whitegoodsVo", whitegoodsVo);
		model.addAttribute("productImgList", productImgList);
		return "/whitegoods/whitegoodsUpdate";
	}
	
	//삭제하기
	@RequestMapping(value="/whitegoodsDelete/{w_no}", method=RequestMethod.GET)
	public String whitegoodsDelete(@PathVariable("w_no") int w_no) throws Exception {
		WhitegoodsVo whitegoodsVo = whitegoodsService.detailWhitegoods(w_no);
		//p_no2는 상품 설명 이미지 저장된 테이블에 있는 이름들 가져와서 파일을 S3에서 지우기 위함.
		int p_no2 = whitegoodsVo.getP_no();
		List<String> files = whitegoodsService.productImgList(p_no2);
		for(int i = 0; i<files.size(); i++) {
			String file = files.get(i);
			UploadFileUtils.delete(file);
		}
		whitegoodsService.productImgDelete(p_no2);
		//상품 대표이미지 S3에서 삭제하기 위해 이름 가져와야함.
		String thumbnail = whitegoodsVo.getW_thumbimg();
		UploadFileUtils.delete(thumbnail);
		
		whitegoodsService.deleteWhitegoods(w_no);
		return "redirect:/";
	}
	
	//수정
	@RequestMapping(value="/whitegoodsUpdateRun", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	public String whitegoodsUpdateRun(WhitegoodsVo whitegoodsVo, ProductImgVo productImgVo, MultipartFile file, HttpSession session) throws Exception{
		if(file != null || !file.equals("")) {
			String fileName = file.getOriginalFilename();
			boolean isImage = UploadFileUtils.isImage(fileName);
			String upload = null;
			if(isImage) {
				File isFile = new File(file.getOriginalFilename());
				file.transferTo(isFile);
				String fileNames = UploadFileUtils.upload(isFile, fileName);
				upload = fileNames;
			} else {
				upload = null;
			}
			
			whitegoodsVo.setW_thumbimg(upload);
		}
		
		if(productImgVo.getImg_name() != null) {
			whitegoodsService.imgInsert(whitegoodsVo, productImgVo);
		}
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		whitegoodsVo.setW_seller(m_id);
		
		whitegoodsService.updateWhitegoods(whitegoodsVo);
		return "redirect:/";
	}
}