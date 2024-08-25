package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.xa.XAException;

import org.apache.maven.shared.utils.io.IOUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ClothesVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.MessageVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.SanctionVo;
import com.kh.team.domain.WhitegoodsVo;
import com.kh.team.service.ClothesService;
import com.kh.team.service.MemberService;
import com.kh.team.service.SanctionService;
import com.kh.team.service.SellProductService;
import com.kh.team.util.UploadFileUtils;



@Controller
@RequestMapping("/sellproduct")
public class SellProductContoller {

	String buckteName = "teamptbucket";
	
	
	@Inject
	private SellProductService sellProductService;
	
	@Inject
	private ClothesService clothesService;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private SanctionService sanctionService;

	
	//판매하기 화면 이동
	@RequestMapping(value="/sellproductMain", method=RequestMethod.GET)
	public String sellproductMain(HttpSession session, Model model) throws Exception {
		return "/sell/sellproductmain";
	}
	
	//상품판매
	@RequestMapping(value="/sellproduct", method=RequestMethod.GET)
	public String sellproductPage(Model model) throws Exception {
		List<CategoryVo> firstCategoryList = sellProductService.firstCategoryList();
		model.addAttribute("firstCategoryList", firstCategoryList);
		return "/sell/sellproduct";
	}
	
	//판매상품 카테고리 선택시 하위카테고리 가져오기
	@RequestMapping(value="/getCategoryList", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryVo> getCategoryList(String cate_no) throws Exception {
		List<CategoryVo> categoryList = sellProductService.getCategoryList(cate_no);
		return categoryList;
	}
	
	//가전제품 등록
	@RequestMapping(value="/whitegoodsUpload", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	public String whitegoodsUpload(MultipartFile file, ProductVo productVo, ProductImgVo productImgVo, HttpSession session, RedirectAttributes rttr) throws Exception {
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
		
		WhitegoodsVo whitegoodsVo = new WhitegoodsVo();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		whitegoodsVo.setW_name(productVo.getP_name());
		whitegoodsVo.setW_seller(memberVo.getM_id());
		whitegoodsVo.setW_price(productVo.getP_price());
		whitegoodsVo.setCate_no(productVo.getCate_no());
		whitegoodsVo.setW_content(productVo.getP_content());
		whitegoodsVo.setW_thumbimg(upload);

		sellProductService.whitegoodsInsert(whitegoodsVo, productImgVo);
		
		int p_no = whitegoodsVo.getP_no();
		productVo.setP_seller(memberVo.getM_id());
		productVo.setP_no(p_no);
		productVo.setP_no2(p_no);
		productVo.setP_thumbimg(upload);
		sellProductService.insertProduct(productVo);
		
		rttr.addFlashAttribute("msg", "upload");
		return "redirect:/";
	}
	
	//의류 등록
	@RequestMapping(value="/clothesUpload", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	public String clothesUpload(MultipartFile file, ProductVo productVo, HttpSession session, RedirectAttributes rttr) throws Exception {
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
//		System.out.println("productVo: " + productVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		ClothesVo clothesVo = new ClothesVo();
		clothesVo.setP_name(productVo.getP_name());
		clothesVo.setP_seller(memberVo.getM_id());
		clothesVo.setP_price(productVo.getP_price());
		clothesVo.setCate_no(productVo.getCate_no());
		clothesVo.setP_content(productVo.getP_content());
		clothesVo.setP_thumbimg(upload);
		
		clothesService.insertClothes(clothesVo);
		
		int p_no = clothesVo.getP_no();
		productVo.setP_seller(memberVo.getM_id());
		productVo.setP_no(p_no);
		productVo.setP_no2(p_no);
		productVo.setP_thumbimg(upload);
		sellProductService.insertProduct(productVo);
		
		rttr.addFlashAttribute("msg", "upload");
		return "redirect:/";
	}
	
	//가구 등록
	@RequestMapping(value="/furnitureUpload", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	public String furnitureUpload(MultipartFile file, ProductVo productVo) throws Exception {
		String fileName = file.getOriginalFilename();
		boolean isImage = UploadFileUtils.isImage(fileName);
		String upload;
		if(isImage) {
			File isFile = new File(file.getOriginalFilename());
			file.transferTo(isFile);
			
			String fileNames = UploadFileUtils.upload(isFile, fileName);
			upload = fileNames;
		} else {
			upload = null;
		}
		return "redirect:/";
	}
	
	//컴퓨터 등록
	@RequestMapping(value="/computerUpload", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	public String computerUpload(MultipartFile file, ProductVo productVo, ProductImgVo productImgVo, HttpSession session, RedirectAttributes rttr) throws Exception {
		System.out.println("ProductVo: " + productVo);
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
		
		ComputerVo computerVo = new ComputerVo();
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		computerVo.setC_com_cate_no(productVo.getCate_no());
		computerVo.setC_com_name(productVo.getP_name());
		computerVo.setC_com_seller(memberVo.getM_id());
		computerVo.setC_com_price(productVo.getP_price());
		computerVo.setC_com_content(productVo.getP_content());
		computerVo.setC_com_pic(upload);
		
		sellProductService.computerInsert(computerVo, productImgVo);
		
		int p_no = computerVo.getP_no();
		productVo.setP_seller(memberVo.getM_id());
		productVo.setP_no(p_no);
		productVo.setP_no2(p_no);
		productVo.setP_thumbimg(upload);
		sellProductService.insertProduct(productVo);
		
		rttr.addFlashAttribute("msg", "upload");
		return "redirect:/";
	}
	
	//판매자 등록화면 이동
	@RequestMapping(value="/registration", method=RequestMethod.GET)
	public String registration(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		SanctionVo sanctionVo = sanctionService.searchSanc(m_id);
		String page;
		if(sanctionVo == null) {
			page = "/sell/sellerreg";
		} else {
			if(sanctionVo.getSanc_count() >= 3) {
				page = "/sell/sellproductmain";
				model.addAttribute("msg", "Count3");
			} else {
				page = "/sell/sellerreg";
			}
		}
		return page;
	}
	
	//판매자 등록
	@RequestMapping(value="/registrationRun", method=RequestMethod.GET)
	public String registrationRun(HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String m_id = memberVo.getM_id();
		String m_pass = memberVo.getM_pass();

		model.addAttribute("msg", "sellerReg");
		sellProductService.sellerReg(m_id);			
		session.removeAttribute("memberVo");

		memberVo = memberService.login(m_id, m_pass);
		session.setAttribute("memberVo", memberVo);
				
		return "/sell/sellproductmain";
	}
	
	//이미지 출력(아직 안됨)
	@RequestMapping(value="/displayImage", method=RequestMethod.GET, produces="application/test;charset=utf-8")
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtil.toByteArray(fis);
		return bytes;
	}

	//이미지 등록시 업로드
	@RequestMapping(value="/uploadedFile", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	@ResponseBody
	public String uploadedFile(MultipartFile file, String str, HttpSession session, HttpServletRequest request, Model model) throws Exception {
//		System.out.println("file: " + file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
		boolean isImage = UploadFileUtils.isImage(fileName);
		String upload;
		if(isImage) {
			File isFile = new File(file.getOriginalFilename());
			file.transferTo(isFile);
			
			String fileNames = UploadFileUtils.upload(isFile, fileName);
			upload = fileNames;
		} else {
			upload = "fail";
		}
		return upload;
	}
	
	@RequestMapping(value="/deleteAjax", method=RequestMethod.POST, produces="application/test;charset=utf-8")
	@ResponseBody
	public String deleteAjax(String filename) throws Exception {
		UploadFileUtils.delete(filename);
		return "success";
	}
	
	// 직접 구매하기위해 판매자에게 메시지 보내기
	@ResponseBody
	@RequestMapping(value="/message" , method=RequestMethod.POST)
	public String seller_TO_message(MessageVo messageVo) throws Exception {
		System.out.println("messageVo : " + messageVo);
		sellProductService.seller_TO_message(messageVo);
		return "success";
	}
	
	// 내 메시지 함으로 이동
	@RequestMapping(value="/messageList" , method=RequestMethod.GET)
	public String messageList(Model model, String m_id) throws Exception {
		System.out.println("m_id : " + m_id);

		// 받은 메시지함
		List<MessageVo> receive_MessageList = sellProductService.receive_MessageList(m_id);
		model.addAttribute("receive_MessageList" , receive_MessageList);
		
		// 보낸 메시지함
		List<MessageVo> send_MessageList = sellProductService.send_MessageList(m_id);
		model.addAttribute("send_MessageList" , send_MessageList);
		
		return "/sell/messageList";
	}
	
	// 메시지 내용
	@RequestMapping(value="/messageContent" , method=RequestMethod.GET)
	public String messageContent(Model model, int msg_no, String type) throws Exception {
		
		System.out.println("type : " + type);
		
		MessageVo messageVo = sellProductService.messageContent(msg_no);
		
		// 메시지 번호에 해당하는 데이터 받아오기
		model.addAttribute("messageVo" , messageVo);
		
		// 받은 보낸 메시지 구분
		model.addAttribute("type" , type);
		
		return "/sell/messageContent";
	}
	
	@RequestMapping(value="/replyMessageForm" , method=RequestMethod.GET)
	public String replyMessageForm(Model model, int msg_no) throws Exception {
		MessageVo messageVo = sellProductService.messageContent(msg_no);
		model.addAttribute("messageVo" , messageVo);
		return "/sell/replyMessageForm";
	}
}
