package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.EmailDto;
import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;
import com.kh.team.domain.SanctionVo;
import com.kh.team.service.AdminService;
import com.kh.team.service.SanctionService;
import com.kh.team.service.ServiceService;
import com.kh.team.service.WhitegoodsService;
import com.kh.team.util.UploadFileUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	private ServiceService serviceService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	private SanctionService sanctionService;
	
	@Inject
	private WhitegoodsService whitegoodsService;
	
	@Inject
	private AdminService adminService;

	//관리자 시작페이지로 이동
	@RequestMapping(value="/adminForm", method=RequestMethod.GET)
	public String adminForm() throws Exception {
		
		return "/admin/adminform";
	}
	
	//관리자 회원관리 페이지로 이동
	@RequestMapping(value="/adminMember", method=RequestMethod.GET)
	public String adminMember() throws Exception {
		
		return "/admin/admin_member";
	}
	
	//관리자 카테고리 관리페이지로 이동
	@RequestMapping(value="/adminCategory", method=RequestMethod.GET)
	public String adminCategory() throws Exception {
		
		return "/admin/admin_category";
	}
	
	//관리자 게시물 관리 페이지
	@RequestMapping(value="/adminDetail", method=RequestMethod.GET)
	public String adminDetail() throws Exception {
		
		return "/admin/admin_detailpage";
	}
	
	//관리자 회원관리-회원관리 페이지
	@RequestMapping(value="/adminMemberCon", method=RequestMethod.GET)
	public String adminMemberCon(Model model) throws Exception {
		List<MemberVo> memberList = adminService.adminMemberSearch();
		model.addAttribute("memberList", memberList);
		return "/admin/a_m_con";
	}
	
	//관리자 회원관리 - 판매자 정보 관리 페이지
	@RequestMapping(value="/adminMemberSellCon", method=RequestMethod.GET)
	public String adminMemberSellCon(Model model) throws Exception {
		List<SanctionVo> sancList = sanctionService.sancList();
		List<MemberVo> sellerList = adminService.sellerList();
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("sancList", sancList);
		return "/admin/a_m_seller";
	}
	
	//관리자페이지 판매자 권한 삭제
	@RequestMapping(value="/adminRollbackSeller/{m_id}", method=RequestMethod.GET)
	public String adminRollbackSeller(@PathVariable("m_id") String m_id, RedirectAttributes rttr) throws Exception {
		System.out.println("m_id: " + m_id);
		adminService.rollbackSeller(m_id);
		SanctionVo sanctionVo = sanctionService.searchSanc(m_id);
		if(sanctionVo == null) {
			sanctionService.newSanc(m_id);
		} else {
			sanctionService.sancUpdate(m_id);
		}
		rttr.addFlashAttribute("msg", "selling_delete_success");
		return "redirect:/admin/adminMemberSellCon";
	}
	
	//관리자페이지 회원 강제탈퇴
	@RequestMapping(value="/adminMemberDelete/{m_id}", method=RequestMethod.GET)
	public String adminMemberDelete(@PathVariable("m_id") String m_id, RedirectAttributes rttr) throws Exception{
		whitegoodsService.userPAlldelete(m_id);
		adminService.adminMemberDelete(m_id);
		rttr.addFlashAttribute("msg", "member_delete_success");
		return "redirect:/admin/adminMemberCon";
	}
	
	//게시글 삭제 페이지로 이동
	@RequestMapping(value="detailDelete", method=RequestMethod.GET)
	public String detailDeletePage(Model model) throws Exception{
		List<ProductVo> allProductList = adminService.allProductList();
		List<CategoryVo> categoryList = adminService.getCategoryList();
		List<CategoryVo> firstCategory = adminService.firstCategoryList();
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("firstCategory", firstCategory);
		return "/admin/a_d_delete";
	}
	
	//게시글 삭제페이지 카테고리 별 띄우기
	@RequestMapping(value="detailDeleteCatePage/{cate_no}", method=RequestMethod.GET)
	public String detailDeleteCatePage(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		List<ProductVo> productCateList = adminService.productCateList(cate_no);
		List<CategoryVo> categoryList = adminService.getCategoryList();
		model.addAttribute("allProductList", productCateList);
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_d_delete";
	}
	
	//게시글 삭제
	@RequestMapping(value="/adminProductDelete", method=RequestMethod.GET)
	@ResponseBody
	public String adminDelete(String cate_no, int p_no, int p_no2, Model model) throws Exception{
		String imgName = adminService.imgNameSearch(p_no2);
		UploadFileUtils.delete(imgName);
		String[] filenames = adminService.productImgList(p_no2);
		for(int i = 0; i<filenames.length;i++) {
			String img_name = filenames[i];
			UploadFileUtils.delete(img_name);
		}
		String cate_sub = cate_no.substring(0, 2);
		if(cate_sub.equals("50")) {
			//컴퓨터
			adminService.adminComputerDelete(p_no, p_no2);
		} else if(cate_sub.equals("10")) {
			//의류
			adminService.adminClothesDelete(p_no, p_no2);
		} else if(cate_sub.equals("20")) {
			//가구
			String cate_sub2 = cate_no.substring(0,3);
			if(cate_sub2.equals("201")) {
				adminService.adminFLifeDelete(p_no, p_no2);
			} else if(cate_sub2.equals("202")) {
				adminService.adminFInteriorDelete(p_no, p_no2);
			} else if(cate_sub2.equals("203")) {
				adminService.adminFBedDelete(p_no, p_no2);
			} else if(cate_sub2.equals("204")) {
				adminService.adminFKitchenDelete(p_no, p_no2);
			}
		} else if(cate_sub.equals("30")) {
			//가전제품
			adminService.adminWhitegoodsDelete(p_no, p_no2);
		}
		return "success";
	}
	
	//카테고리 추가 페이지로 이동
	@RequestMapping(value="/adminCategoryInput", method=RequestMethod.GET)
	public String adminCategoryInput(Model model) throws Exception {
		List<CategoryVo> firstCategoryList = adminService.firstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
		return "/admin/a_c_input";
	}
	
	//카테고리 삭제 페이지로 이동
	@RequestMapping(value="/adminCategoryDelete", method=RequestMethod.GET)
	public String adminCategoryDelete(Model model) throws Exception {
		List<CategoryVo> categoryList = adminService.getCategoryList();
		List<CategoryVo> firstCategory = adminService.firstCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("firstCategory", firstCategory);
		return "/admin/a_c_delete";
	}
	
	//카테고리 삭제
	@RequestMapping(value="/CategoryDelete/{cate_no}", method=RequestMethod.GET)
	public String CategoryDelete(@PathVariable("cate_no") String cate_no , Model model, RedirectAttributes rttr) throws Exception {
		adminService.adminCategoryDelete(cate_no);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/adminCategoryDelete";
	}
	
	//카테고리 별 삭제 페이지로 이동
	@RequestMapping(value="/categoryDeletePage/{cate_no}", method=RequestMethod.GET)
	public String categoryDeletePage(@PathVariable("cate_no") String cate_no, Model model) throws Exception {
		List<CategoryVo> categoryList = adminService.categoryDeleteList(cate_no);
		model.addAttribute("categoryList", categoryList);
		return "/admin/a_c_delete";
	}
	
	
	//카테고리 선택 시 하위 분류 가져오기
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> otherCategoryList = adminService.otherCategoryList(cate_ref);
		return otherCategoryList;
	}
	
	//카테고리 추가
	@RequestMapping(value="/categoryInsert", method=RequestMethod.GET)
	public String categoryInsert(String cate_name, String cate_ref, RedirectAttributes rttr) throws Exception {
		System.out.println("cate_name: " + cate_name);
		System.out.println("cate_ref: " + cate_ref);
		String cate_no = null;
		if(cate_ref.equals("")) {
			List<CategoryVo> firstCategoryList = adminService.firstCategoryList();
			int categoryLength = firstCategoryList.size();
			int cate_num = categoryLength + 1;
			String num = Integer.toString(cate_num);
			cate_no = num + "0";
		} else if(!cate_ref.equals("")) {
			List<CategoryVo> otherCategoryList = adminService.otherCategoryList(cate_ref);
			int categoryLength = otherCategoryList.size();
			int catenum = categoryLength + 1;
			String num = Integer.toString(catenum);
			cate_no = cate_ref + num;
		}
		CategoryVo categoryVo = new CategoryVo();
		categoryVo.setCate_no(cate_no);
		categoryVo.setCate_name(cate_name);
		categoryVo.setCate_ref(cate_ref);
		adminService.adminCategoryInput(categoryVo);
		
		rttr.addFlashAttribute("msg", "category_input_success");
		return "redirect:/admin/adminCategoryInput";
	}
	
	//고객센터 페이지
	@RequestMapping(value="/adminService", method=RequestMethod.GET)
	public String adminService() throws Exception{
		return "/admin/admin_service";
	}
	
	//Q&A 페이지
	@RequestMapping(value="/adminQandAMain", method=RequestMethod.GET)
	public String adminQandAMain() throws Exception {
		return "/admin/a_q_main";
	}
	
	//Q&A 추가 페이지
	@RequestMapping(value="/adminQandAInput", method=RequestMethod.GET)
	public String adminQandAInput(Model model) throws Exception {
		List<QACateVo> firstQACategory = adminService.firstQACategory();
		model.addAttribute("firstQACategory", firstQACategory);
		return "/admin/a_q_input";
	}
	
	//Q&A 추가 페이지서 1카테고리 선택 시 하위 카테고리 띄우기
	@RequestMapping(value="/adminQACategorySelect", method=RequestMethod.GET)
	@ResponseBody
	public List<QACateVo> adminQACategorySelect(String qa_cate_no) throws Exception{
		List<QACateVo> otherQACategoryList = adminService.otherQACategory(qa_cate_no);
		return otherQACategoryList;
	}
	
	//Q&A 추가하기
	@RequestMapping(value="/adminQAInsert", method=RequestMethod.GET)
	public String adminQAInsert(QandAVo qandaVo, RedirectAttributes rttr) throws Exception{
		System.out.println("QandAVo: " + qandaVo);
		adminService.qaInsert(qandaVo);
		rttr.addFlashAttribute("msg", "qa_insert_success");
		return "redirect:/admin/adminQandAMain";
	}
	
	//Q&A 수정/삭제 페이지
	@RequestMapping(value="/adminQandADelete", method=RequestMethod.GET)
	public String adminQandADelete(Model model) throws Exception {
		List<QandAVo> QA_UDList = adminService.QA_UDList();
		List<QACateVo> QACategory = adminService.QACategory();
		model.addAttribute("QA_UDList", QA_UDList);
		model.addAttribute("QACategory", QACategory);
		return "/admin/a_q_delete";
	}
	
	//Q&A 수정 페이지로
	@RequestMapping(value="/qaUpdate/{qa_no}", method=RequestMethod.GET)
	public String QandAUpdate(@PathVariable("qa_no")int qa_no, Model model) throws Exception {
		QandAVo qaDetail= adminService.QandADetail(qa_no);
		List<QACateVo> firstQACategory = adminService.firstQACategory();
		model.addAttribute("qaDetail", qaDetail);
		model.addAttribute("firstQACategory", firstQACategory);
		return "/admin/a_q_update";
	}
	
	//Q&A 수정하기
	@RequestMapping(value="/qaUpdateRun", method=RequestMethod.GET)
	public String QandAUpdateRun(QandAVo qandAVo, RedirectAttributes rttr) throws Exception {
		adminService.QAUpdate(qandAVo);
		rttr.addFlashAttribute("msg", "qa_update_success");
		return "redirect:/admin/adminQandADelete";
	}
	
	//Q&A 삭제
	@RequestMapping(value="/QandADeleteRun", method=RequestMethod.GET)
	@ResponseBody
	public String QandADeleteRun(int qa_no) throws Exception{
		adminService.QADelete(qa_no);
		return "success";
	}
	
	//Q&A 카테고리 추가 페이지 이동
	@RequestMapping(value="/adminQandACategoryInput", method=RequestMethod.GET)
	public String QandACategoryInput(Model model) throws Exception{
		List<QACateVo> firstQACategory = adminService.firstQACategory();
		model.addAttribute("firstQACategory", firstQACategory);
		return "/admin/a_q_cateInput";
	}
	
	//Q&A 카테고리 추가
	@RequestMapping(value="/QandACategoryInputRun", method=RequestMethod.GET)
	public String QandACategoryInputRun(String qa_cate_name, String qa_cate_ref, RedirectAttributes rttr) throws Exception{
		String qa_cate_no = null;
		if(qa_cate_ref.equals("")) {
			List<QACateVo> firstCategory = adminService.firstQACategory();
			int categoryLength = firstCategory.size();
			int cate_num = categoryLength + 1;
			String num = Integer.toString(cate_num);
			qa_cate_no = num + "0";
		} else if(!qa_cate_ref.equals("")) {
			List<QACateVo> otherCategory = adminService.otherQACategory(qa_cate_ref);
			int categoryLength = otherCategory.size();
			int catenum = categoryLength + 1;
			String num = Integer.toString(catenum);
			qa_cate_no = qa_cate_ref + num;
		}
		QACateVo qaCateVo = new QACateVo();
		qaCateVo.setQa_cate_no(qa_cate_no);
		qaCateVo.setQa_cate_name(qa_cate_name);
		qaCateVo.setQa_cate_ref(qa_cate_ref);
		adminService.qaCategoryInsert(qaCateVo);
		rttr.addFlashAttribute("msg", "qa_cate_insert_success");
		return "redirect:/admin/adminQandAMain";
	}
	
	//Q&A 카테고리 삭제 페이지 이동
	@RequestMapping(value="/adminQandACategoryDelete", method=RequestMethod.GET)
	public String QandACategoryDelete(Model model) throws Exception{
		List<QACateVo> QACategory = adminService.QACategory();
		model.addAttribute("QACategory", QACategory);
		return "/admin/a_q_cateDelete";
	}
	
	//Q&A 카테고리 삭제
	@RequestMapping(value="/QandACategoryDeleteRun", method=RequestMethod.GET)
	@ResponseBody
	public String QandACategoryDeleteRun(String qa_cate_no) throws Exception{
		adminService.qaCategoryDelete(qa_cate_no);
		return "success";
	}
	
	//1:1문의 접수 페이지
	@RequestMapping(value="/adminInquiry", method=RequestMethod.GET)
	public String adminInquiry(Model model) throws Exception {
		List<InquiryVo> inquiryList = adminService.inquiryList();
		model.addAttribute("inquiryList", inquiryList);
		return "/admin/a_inq";
	}
	
	//1:1문의 답변 페이지
	@RequestMapping(value="/inquiryAnswer/{inquiry_no}", method=RequestMethod.GET)
	public String adminInquiryAnswer(@PathVariable("inquiry_no") int inquiry_no, Model model) throws Exception{
		InquiryVo inquiryVo = adminService.detailInquiry(inquiry_no);
		model.addAttribute("inquiryVo", inquiryVo);
		return "/admin/a_inq_answer";
	}
	
	//1:1문의 메일 송부
	@RequestMapping(value="/sendMail", method=RequestMethod.POST)
	@ResponseBody
	public String sendMail(EmailDto emailDto, int inquiry_no) throws Exception{
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom(emailDto.getFrom());
				helper.setTo(emailDto.getTo());
				helper.setSubject(emailDto.getSubject());
				helper.setText(emailDto.getContent());
			}
		};
		mailSender.send(preparator);
		adminService.deleteInquiry(inquiry_no);
		return "success";
	}
	
	//공지사항 페이지
	@RequestMapping(value="/adminNotice", method=RequestMethod.GET)
	public String adminNotice(Model model) throws Exception {
		List<NoticeVo> noticeList = serviceService.noticeList();
		model.addAttribute("noticeList", noticeList);
		return "/admin/a_notice";
	}
	
	//공지사항 작성 페이지
	@RequestMapping(value="/adminNoticeWrite", method=RequestMethod.GET)
	public String adminNoticeWrite() throws Exception{
		return "/admin/a_notice_write";
	}
	
	//공지사항 작성
	@RequestMapping(value="/insertNotice", method=RequestMethod.GET)
	public String insertNotice(NoticeVo noticeVo, RedirectAttributes rttr) throws Exception{
		adminService.insertNotice(noticeVo);
		rttr.addFlashAttribute("msg", "notice_write_success");
		return "redirect:/admin/adminNotice";
	}
	
	//공지사항 상세보기
	@RequestMapping(value="/noticeDetail/{notice_no}", method=RequestMethod.GET)
	public String adminNoticeDetail(@PathVariable("notice_no") int notice_no, Model model) throws Exception{
		NoticeVo noticeDetail = serviceService.noticeDetail(notice_no);
		model.addAttribute("noticeDetail", noticeDetail);
		return "/admin/a_notice_detail";
	}
	
	//공지사항 삭제하기
	@RequestMapping(value="/noticeDelete/{notice_no}", method=RequestMethod.GET)
	public String adminNoticeDelete(@PathVariable("notice_no") int notice_no, RedirectAttributes rttr) throws Exception {
		adminService.noticeDelete(notice_no);
		rttr.addFlashAttribute("msg", "notice_delete_success");
		return "redirect:/admin/adminNotice";
	}
}
