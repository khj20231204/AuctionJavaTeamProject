package com.kh.team.controller;



import java.util.List;




import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.ComputerCommentVo;

import com.kh.team.domain.ProductExplainVo;
import com.kh.team.service.ComputerCommentService;
import com.kh.team.service.ComputersService;



@RestController
@RequestMapping("/computerProductComment")
public class ComputerProductCommnetController {
	
	//인덱스
	private int CHECK_FOR_INDEX = 1;	
	
	//인젝
	@Inject
	private ComputersService computersService;
	
	//인젝
	@Inject
	private ComputerCommentService computerCommentService;
	
	//구매후기 리스트 가져오기
	@RequestMapping(value="/commentShow", method=RequestMethod.POST)
	public List<ComputerCommentVo> commentShow(int p_no) throws Exception{
		System.out.println("commentShow + p_no:" + p_no);
		//구매후기 리스트 가져오기
		List<ComputerCommentVo> list = computerCommentService.getCommentList(p_no);
		return list;
	}
	
	//구매후기 삭제
	@RequestMapping(value="/deleteRef", method=RequestMethod.POST)
	public int deleteRef(int c_com_comment_no, String c_com_product) throws Exception{
		System.out.println("c_com_comment_no:" + c_com_comment_no);
		//구매후기 삭제
		computerCommentService.deleteComment(c_com_comment_no);
		//컴퓨터 제품 구매 폼 구매후기 갯수 보여주기
		int countComment = computersService.buyComputerComment(c_com_product);
		return countComment;		
	}
	
	//구매후기 수정
	@RequestMapping(value="/updateRefContent", method=RequestMethod.POST)
	public String updateRefContent(String c_com_comment_content, int c_com_comment_no) throws Exception{
		System.out.println("c_com_comment_content:" + c_com_comment_content);
		System.out.println("c_com_comment_no:" + c_com_comment_no);	
		//구매후기 수정
		int count = computerCommentService.changeCommentContent(c_com_comment_no, c_com_comment_content);
		System.out.println("count:" + count);
		return "success";		
	}
	
	//상품문의 리스트 가져오기
	@RequestMapping(value="/inquireShow/{p_no}", method=RequestMethod.GET)
	public List<ProductExplainVo> inquireShow(@PathVariable("p_no") int p_no) throws Exception{
		System.out.println("inquireShow + p_no:" + p_no);
		//상품문의 리스트 가져오기
		List<ProductExplainVo> list = computerCommentService.getInquireList(p_no);
		return list;
	}

	//상품문의 기입
	@RequestMapping(value="/insertInquireExpain", method=RequestMethod.POST)
	public int insertInquireExpain(ProductExplainVo productExplainVo) throws Exception{
		System.out.println("p_e_id:" + productExplainVo.getP_e_id());
		System.out.println("p_e_title:" + productExplainVo.getP_e_title());
		System.out.println("p_e_inquiry_status:" + productExplainVo.getP_e_inquiry_status());
		System.out.println("p_e_product:" + productExplainVo.getP_e_product());
		//상품문의 기입
		computerCommentService.insetInquire(productExplainVo);
		String p_e_product = productExplainVo.getP_e_product();
		//상품문의 갯수 가져오기
		int countExplain = computersService.buyComputerExplain(p_e_product);
		return countExplain;		
	}
	
	//상품문의 검색
	@RequestMapping(value="/searchInquireExplain", method=RequestMethod.POST)
	public List<ProductExplainVo> searchInquireExplain(ProductExplainVo productExplainVo) throws Exception{
		System.out.println("p_e_title:" + productExplainVo.getP_e_title());
		System.out.println("p_e_inquiry_status:" + productExplainVo.getP_e_inquiry_status());
		System.out.println("p_e_product:" + productExplainVo.getP_e_product());
		//상품문의 검색하여 리스트 가져오기
		List<ProductExplainVo> list = computerCommentService.searchInquire(productExplainVo);
		return list;		
	}
	
	//선호도 기능
	@RequestMapping(value="/sendForGetPurchaseLike", method=RequestMethod.POST)	
	public String sendForGetPurchaseLike(BuyComputerVo buyComputerVo) throws Exception{		
		String nok = "nok";
		int like_num_plus = 1;
		
		//해당 상품 선호도 1증가
		int count = computersService.getPurchaseLike(buyComputerVo,like_num_plus ,nok);
		int c_com_no = buyComputerVo.getC_com_no();
		
		//전체 컴퓨터 카테고리내의 선호도 합계 가져오기
		int select_like = computersService.getTotalNumLike(nok);
		System.out.println("select_like:" + select_like);
		
		//해당 상품 선호도 갯수 가져오기
		int likeNum = computersService.getProductNumLike(c_com_no);
		System.out.println("likeNum:" + likeNum);
		
		double productBuyLike = 0;
		if(select_like != 0) {
			//구매율 구하는 수식
			productBuyLike = ((double)likeNum / (double)select_like) * 100;
			double resultLike = productBuyLike * 100;
			//소수점 2번째이하로 절삭
			double resultAgainLike =  Math.floor(resultLike);
			productBuyLike = resultAgainLike / 100;
			
			System.out.println("productBuyLike:" + productBuyLike);
			System.out.println("result:" + resultLike);
			System.out.println("resultAgain:" + resultAgainLike);			
		}
		String view = "";
		if(count == CHECK_FOR_INDEX) {
			//구매율 보내기
			view = Double.toString(productBuyLike);
		}else {
			view = "fail";
		}
		return view;		
	}
	
	//상품문의 답변
	@RequestMapping(value="/explainRef", method=RequestMethod.POST)
	public String explainRef(int p_e_no, String ref_content) throws Exception{
		System.out.println("p_e_no:" + p_e_no);
		System.out.println("ref_content:" + ref_content);
		//상품문의 답변
		int count = computerCommentService.explainRefContent(p_e_no, ref_content);
		System.out.println("count:" + count);
		String result = "";
		if(count == CHECK_FOR_INDEX) {
			result = "success";
		}else {
			result = "fail";
		}		
		return result;
	}	
}