package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;
import com.kh.team.service.ServiceService;

@Controller
@RequestMapping("/service")
public class ServicecenterContorller {

	@Inject
	private ServiceService serviceService;
	
	//고객센터 페이지
	@RequestMapping(value="serviceMain", method=RequestMethod.GET)
	public String serviceMain(HttpSession session, Model model) throws Exception{
		List<NoticeVo> noticeList = serviceService.noticeList();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("memberVo", memberVo);
		return "/service/service_center";
	}
	
	//공지사항
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String serviceNotice(Model model) throws Exception {
		List<NoticeVo> noticeList = serviceService.noticeList();
		model.addAttribute("noticeList", noticeList);
		return "/service/notice";
	}
	
	//공지사항 게시물 클릭
	@RequestMapping(value="/noticeDetail/{notice_no}", method=RequestMethod.GET)
	public String noticeDetail(@PathVariable("notice_no") int notice_no, Model model) throws Exception{
		NoticeVo noticeDetail = serviceService.noticeDetail(notice_no);
		model.addAttribute("noticeDetail", noticeDetail);
		return "/service/noticeDetail";
	}
	
	//자주하는 질문
	@RequestMapping(value="/Q&A", method=RequestMethod.GET)
	public String serviceQandA(Model model) throws Exception {
		List<QandAVo> QAList = serviceService.allQAList();
		List<QACateVo> qaCategoryList = serviceService.QACategoryList();
		List<QACateVo> firstQACategory = serviceService.firstQACate();
		model.addAttribute("QAList", QAList);
		model.addAttribute("qaCategoryList", qaCategoryList);
		model.addAttribute("firstQACategory", firstQACategory);
		return "/service/QA";
	}
	
	//자주하는 질문 카테고리 선택 시
	@RequestMapping(value="/Q&ACategory/{qa_cate_no}", method=RequestMethod.GET)
	public String serviceCategoryQandA(@PathVariable("qa_cate_no")String qa_cate_no, Model model) throws Exception {
		List<QandAVo> QAList = serviceService.categoryQAList(qa_cate_no);
		List<QACateVo> qaCategoryList = serviceService.QACategoryList();
		List<QACateVo> firstQACategory = serviceService.firstQACate();
		model.addAttribute("QAList", QAList);
		model.addAttribute("qaCategoryList", qaCategoryList);
		model.addAttribute("firstQACategory", firstQACategory);
		return "/service/QA";
	}
	
	//1:1문의
	@RequestMapping(value="/inquiry", method=RequestMethod.GET)
	public String serviceInquiry(String m_id, RedirectAttributes rttr) throws Exception {
		String page;
		if(m_id == null || m_id.equals("")) {
			rttr.addFlashAttribute("msg", "inquiryFail");
			return "redirect:/login/loginForm";
		} else {
			page="/service/inquiry";
		}
		return page;
	}
	
	//1:1 문의 등록
	@RequestMapping(value="/inquiryQ", method=RequestMethod.GET)
	public String inquiryQ(InquiryVo inquiryVo, RedirectAttributes rttr) throws Exception {
		serviceService.inquiryQ(inquiryVo);
		rttr.addFlashAttribute("msg", "inquirySuccess");
		return "redirect:/";
	}
	
}
