package com.kh.team.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionOrderVo;
import com.kh.team.domain.AuctionPnoFromTempBiding;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionReceiveOrderVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.AuctionService;
import com.kh.team.util.FurnitureFileUtil;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping(value="/auction")
public class AuctionController implements AuctionS3Key, ImPortKey, JoinSMSKey {

	@Inject
	public AuctionService auctionService;
	
	public AuctionService getAuctionService() {return auctionService;}//장바구니때문에 getter setter 만듦

	public void setAuctionService(AuctionService auctionService) {this.auctionService = auctionService;}

	@RequestMapping(value="/auctionMain", method=RequestMethod.GET)
	public String getAuctoionMainList(Model model) throws Exception{
		
		//최근 날짜의 목록에 따라 메인 이미지만
		List<AuctionSellVo> list = auctionService.getAuctoionMainList();
		//System.out.println("auctionController getAuctionList list:"+list);
		model.addAttribute("list", list);
		
		//sidebar에 배송 보내야 하는 갯수 <- sessioonScope에 넣기
		//int deliveryCount = auctionService.getAuctionOrderDeliveryCount(m_id);
		//model.addAttribute("deliveryCount", deliveryCount);
		//System.out.println("sidebarCount:"+sidebarCount);
		
		makeImgDirectoryAfterCheck();
		
		return "auction/auctionMain";
	}
	
	/*이미지 -> 
	 * 메인 : 가지고 올 때만 폴더 항목으로 검색
	 * 등록 : p_no로 폴더를 만들고 파일당 루프를 돌면서 삽입
	 * 수정 : 파일당 폴더와 s3를 찾아가서 지우고 등록
	 * 
	 * 메인에서만 이미지를 불러오게 되면 낙찰을 받아서 메인에 없는 상태에서 
	 * 다른 컴퓨터에서 낙찰받은 이미지를 불러오면 에러발생 이미지를 불러오는 폼에선 전부 디렉토리 검사
	 * 
	 * getAuctoionMainList - 메인
	 * auctionSelected - 입찰중인 상품 클릭해서 들어갔을 때
	 * auctionPurchaseSelectecd - 내 상품팔기로 들어갔을 때
	 * auctionModify - 수정시
	 * */
	public void makeImgDirectoryAfterCheck() throws Exception{
		/* 시작 할 때 s3에 있는 이미지를 다운 받는다 */
		
		//이미지 리스트를 가져온다
		List<AuctionImgVo> imgList = auctionService.getAuctionImg();
		AuctionFileS3Controll fs3;
		
		for(AuctionImgVo localAuctionImgVo : imgList) {//로컬에 없는 폴더를 먼저 고른다
			String localFolderName = Integer.toString(localAuctionImgVo.getP_no());

			if(FurnitureFileUtil.chkDirecotry(localFolderName)) {//폴더가 없으면
				//System.out.println("Controller 안에 localFolderName-------:"+localFolderName);
				for(AuctionImgVo auctionImgVo : imgList) {
					
					String filePathName =auctionImgVo.getImg_name();
					String[] filePathNameArray = filePathName.split("/");
					String folderName = filePathNameArray[3];
					String fileName = filePathNameArray[4];
					/*
					filePathNameArray[0]:C:
					filePathNameArray[1]:Temp
					filePathNameArray[2]:auctionImg
					filePathNameArray[3]:15
					filePathNameArray[4]:2_5b68f941-1b63-486e-be6e-a19f119bab0b.jpg
					*/
					if(localFolderName.equals(folderName)) {//폴더가 존재하지 않으면 s3접속 파일을 가지고 온다
						
						System.out.println("-------------------------- AuctionController getAuctoionMainList에서 s3에 접속 --------------------------");
					
						fs3 = new AuctionFileS3Controll(filePathName, 0);
						fs3.fileS3Controll();					
					}//if끝
				}//for끝
			}//if끝 
		}//for끝
	}
	
	/* sidebar에 쪽지 형식으로 숫자 남기기위해서
	 * auctionResisterList 
	 * auctionModify
	 * auctionPurchaseSelected
	 * 이 3군데의 controller에 getAuctionOrderDeliveryCount로 count를 가져온다
	 */
	
	@RequestMapping(value="/auctionSellList", method=RequestMethod.GET)
	public String auctionSellList(HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		
		String m_id = memberVo.getM_id();
		
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		//현재 기간으로 db의 expiration_date에 조건을 걸어서 가져온다
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		//입찰중
		List<AuctionSellVo> bidingList = auctionService.getAuctionBidingList(m_id, dtVo);
		model.addAttribute("bidingList",bidingList);
		//System.out.println("bidingList:"+bidingList);
		//입찰 마감
		List<AuctionSellVo> bidingFinishList = auctionService.getAuctionBidingFinishList(m_id, dtVo);
		model.addAttribute("bidingFinishList",bidingFinishList);
		//System.out.println("bidingFinishList:"+bidingFinishList);
		//거래된
		List<AuctionSoldVo> soldList = auctionService.getAuctionUserMemberListSold(m_id);
		model.addAttribute("soldList",soldList);
		
		return "auction/auctionSellList";
	}
	@RequestMapping(value="/auctionPurchaseList", method=RequestMethod.GET)
	public String auctionPurchaseList(HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		
		String m_id = memberVo.getM_id();
		
		//내가 입찰한 상품 3개를 각각 가져와야 뿌려줄 때 타이틀 따로 입찰내용 따로 뿌려줄 수 있다
		//--------------------------------시작 ----------------------------
		//내가 입찰 한 상품 : 타이틀 밑으로 입찰 항목을 보이기 위해선 테이블을 각각 가져와야 한다
		List<AuctionTempBidVo> tempBiding = auctionService.getAuctionPurchaserTempBiding(m_id);
		//System.out.println("tempBiding:"+tempBiding);
		model.addAttribute("tempBiding", tempBiding);
		
		//임시테이블에 p_no 만 가져와서 auction과 auction_main_img에 뿌려준다
		List<AuctionPnoFromTempBiding> tempBidingPno = auctionService.getAuctionPurchaserTmepBidingPno(m_id);
		//System.out.println("tempBidingPno:"+tempBidingPno);
		model.addAttribute("tempBidingPno", tempBidingPno);
		//해당 p_no의 타이틀만 가져온다
		System.out.println("---------------- tempBidingPno:"+tempBidingPno);
		
		if(tempBidingPno != null && tempBidingPno.size() > 0) {
			List<AuctionVo> tempBidingTitle = auctionService.getAuctionPurchaserTempBidingTitle(tempBidingPno);
			//System.out.println("tempBidingTitle:"+tempBidingTitle);
			model.addAttribute("tempBidingTitle", tempBidingTitle);
			//해당 p_no의 이미지만 가져온다
			
			List<AuctionMainImgVo> tempBidingImg = auctionService.getAuctionPurchaserTempBidingImg(tempBidingPno);
			//System.out.println("tempBidingImg:"+tempBidingImg);
			model.addAttribute("tempBidingImg", tempBidingImg);
		}else {
			model.addAttribute("tempBidingTitle", null);
			model.addAttribute("tempBidingImg", null);
		}
			
		//내가 입찰한 상품 -------------------- 끝 ------------------------------ 
		
		//결제완료하면 결제 버튼이 안 보인다
		List<AuctionOrderVo> auctionOrder = auctionService.getAuctionOrderPurchaserList(m_id);
		model.addAttribute("auctionOrder", auctionOrder);
		
		//내가 구매한 상품
		List<AuctionSoldVo> purchaserList = auctionService.getAuctionPurchaserList(m_id);
		model.addAttribute("purchaserList", purchaserList);
		//System.out.println("controller purchaserList:"+purchaserList);
		
		return "auction/auctionPurchaseList";
	}
	
	@RequestMapping(value="/auctionResisterList", method=RequestMethod.GET)
	public String auctionResisterList(Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		String m_id = memberVo.getM_id();
		
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		//폴더 이름을 p_no로 만들고 이미지를 저장하기 위해서 다음 p_no를 가지고 온다
		int nextSeq = auctionService.getNextSeqNumber();
		//System.out.println("auctionResisterList nextSeq:"+nextSeq);
		model.addAttribute("nextPNO", nextSeq);
		
		return "auction/auctionResisterList";
	}
	
	@RequestMapping(value="/auctionSelected", method=RequestMethod.GET)
	public String auctionSelected(int p_no, Model model) throws Exception{
		//이미지 파일 없으면 s3에서 가져오기 체크
		makeImgDirectoryAfterCheck();
		
		/* 여기 접근 하는 경로
		 * 1.메인에서
		 * 2.내 상품에서 - 입찰 중, 입찰 종료, 내가 입찰한, 낙찰 된
		 * 3.수정하기( 확인 하고 나서 수정을 하는 거니깐 다시 상품을 보여줄 필요가 없다 -> 뺌 )
		 * 4.주문서
		 * 5.결제한 상품
		 * 6.결제된 상품
		 * 7.관심 상품
		 * 
		 * 카운트O - 메인 입찰 중, 내 상품에서 입찰 중
		 * 카운트X - 메인에서 기간은 마감됐지만 입찰 안된 상품, 
		 * 			내 상품에서 입찰 종료, 내가 입찰한, 낙찰 된,
		 * 			주문서, 결제한 상품, 결제된 상품, 관심 상품
		 * 
		 *auctionSelected.jsp에서 입찰 하면 2분 추가 -> controller:insertAuctionTempBid -> 시간이 종료되면 -> 
		 *controller:timeOverAutoCommit(여기서 deadline='Y') -> auctionMain.jsp
		 *
		 *
		 *
		 *main에서 입찰자가 없는데 시간이 마감된 경우 -> selected폼에서 timeOverAutionCommit 실행돼서 makeDeadline을 Y로만
		 *main에서 입찰자가 있는데 시간이 마감된 경우 -> selected폼에서 timeOverAutionCommit 실행돼서 데이터 입력 후 deadline을 Y로
		 *selected에서 입찰자가 없는데 시간이 마감된 경우 -> timeOverAutionCommit에서 deadline만 Y로
		 *selected에서 입찰자가 있는데 시간이 마감된 경우 -> timeOverAutionCommit에서 데이터 입력 후 deadline을 Y로
		 *
		 *
		 */ 
		
		AuctionSellVo selectedItem = auctionService.getAuctionSelectedItem(p_no);
		List<AuctionImgVo> selectedImg = auctionService.getAuctionSelectedImg(p_no);
		List<AuctionTempBidVo> tempBidList = auctionService.getAuctionTempBid(p_no);
		int bidCount = auctionService.getAuctionCountBid(p_no);
		
		int tempBidMaxPrice = auctionService.getAuctionTempBidMaxPrice(p_no);
		int presentPrice = selectedItem.getPresent_price();
		
		if(presentPrice>tempBidMaxPrice) {
			model.addAttribute("maxPrice", presentPrice);
		}else {
			model.addAttribute("maxPrice", tempBidMaxPrice);
		}
		
		model.addAttribute("selectedItem", selectedItem);
		model.addAttribute("selectedImg", selectedImg);
		model.addAttribute("tempBidList", tempBidList);
		model.addAttribute("bidCount", bidCount);
		
		return "auction/auctionSelected";
	}
	
	//마감 기간 체크해서 기간이 지났으면 deadline을 Y로 -> timeOverAutionCommit에서 이기능을 if밖으로 빼서 여기서 체크할 필요없다
	private void makeDeadlineToY(int p_no) throws Exception{
		
		//현재 시간
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		int nYear = nDate[0];
		int nMonth = nDate[1];
		int nDay = nDate[2];
		int nHour = nTime[0];
		int nMinute = nTime[1];
		int nSecond = nTime[2];
		System.out.println("nYear:"+nYear+" ,nMonth:"+nMonth+" ,nDay:"+nDay+" ,nHour:"+nHour+" ,nMinute:"+nMinute+" ,nSecond:"+nSecond);
		//마감 시간
		AuctionEDateVo auctionEDateVo = auctionService.getAuctionExpirationDate(p_no);
		int eYear = auctionEDateVo.getE_year();
		int eMonth = auctionEDateVo.getE_month();
		int eDay = auctionEDateVo.getE_day();
		int eHour = auctionEDateVo.getE_hour();
		int eMinute = auctionEDateVo.getE_minute();
		int eSecond = auctionEDateVo.getE_second();
		//System.out.println("eYear:"+eYear+" ,eMonth:"+eMonth+" ,eDay:"+eDay+" ,eHour:"+eHour+" ,eMinute:"+eMinute+" ,eSecond:"+eSecond);
		
		boolean deadLineCheck = true;//기간이 지났으면
		
		if(eYear > nYear) {
			deadLineCheck = false;
			//System.out.println("1");
		}else if(eYear<=nYear && eMonth>nMonth){
			deadLineCheck = false;
			//System.out.println("2");
		}else if(eYear<=nYear && eMonth<=nMonth && eDay>nDay) {
			deadLineCheck = false;
			//System.out.println("3");
		}else if(eYear<=nYear && eMonth<=nMonth && eDay<=nDay && eHour>nHour) {
			deadLineCheck = false;
			//System.out.println("4");
		}else if(eYear<=nYear && eMonth<=nMonth && eDay<=nDay && eHour<=nHour && eMinute>nMinute) {
			deadLineCheck = false;
			//System.out.println("5");
		}else if(eYear<=nYear && eMonth<=nMonth && eDay<=nDay && eHour<=nHour && eMinute<=nMinute && eSecond>nSecond) {
			deadLineCheck = false;
			//System.out.println("6");
		}
		//expiration테이블에 기간이 지났으면 마감기한 Y로 업데이트
		//System.out.println("deadline:" + deadLineCheck);
		if(deadLineCheck) {
			auctionService.updateAuctionExpriationDeadline(p_no);
		}
	}
	
	@RequestMapping(value="/timeOverAutoCommit", method=RequestMethod.GET)
	public String timeOverAutoCommit(int p_no) throws Exception{
	
		//임시 입찰 테이블에 해당 p_no의 테이터가 있을 때만 실행
		AuctionTempBidVo auctionTempBidVo = auctionService.getTempBidFromMaxPrice(p_no);
		if(auctionTempBidVo != null) {
			//temp_bid에서 bid로 insert
			auctionService.insertAutoCommitBid(p_no);
			
			//구매자와 판매자 정보 업데이트 auction의 purchaser와 sold_price 업데이트
			String purchaser = auctionTempBidVo.getTemp_purchaser_id();
			String seller = auctionTempBidVo.getTemp_seller_id();
			int sold_price = auctionTempBidVo.getTemp_bid_price();
			
			auctionService.updateAuctionAfterFinish(purchaser, sold_price, p_no, seller);
		}
		
		//expiration테이블에 마감기한 Y로 업데이트 -> 마감기한Y는 입찰에 상관없이 실행
		auctionService.updateAuctionExpriationDeadline(p_no);
		
		return "redirect:/auction/auctionMain";
	}
	
	@RequestMapping(value="/excercise", method=RequestMethod.GET)
	public String excercise(String pno) throws Exception{
		return "auction/excercise";
	}
	
	@RequestMapping(value="/auctionResister", method=RequestMethod.GET)
	public String auctionResister(int nextPNO, AuctionVo auctionVo, 
			AuctionAddressVo auctionAddressVo, AuctionImgVo auctionImgVo, 
			AuctionEDateVo auctionEDateVo, AuctionMainImgVo auctionMainImgVo, HttpSession session) throws Exception{
		
		//System.out.println("auction EdateVo hour:"+auctionEDateVo.getE_hour()+" ,:minute:"+auctionEDateVo.getE_minute());
		
		auctionAddressVo.setP_no(nextPNO);
		auctionImgVo.setP_no(nextPNO);
		auctionEDateVo.setP_no(nextPNO);
		auctionMainImgVo.setP_no(nextPNO);
		
		//int second = (int)((Math.random()*58)+1);
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		AuctionRDateVo auctionRDateVo = new AuctionRDateVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2], nextPNO);
		
		//auctionVo -> auctionAddressVo -> auctionRDateVo -> auctionEDateVo -> auctionMainImgVo -> auctionImgVo
		String seller = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		
		auctionVo.setSeller(seller);
		auctionService.insertAuction(auctionVo);		
		auctionService.insertAuctionAddress(auctionAddressVo);
		auctionService.insertAuctionRegisterDate(auctionRDateVo);
		auctionService.insertAuctionExpirationDate(auctionEDateVo);
		auctionService.insertAuctionMainImg(auctionMainImgVo);
		auctionService.insertAuctionImg(auctionImgVo);
		
		return "redirect:/auction/auctionMain";
	}

	//오늘 날짜
	private int[] getNowDate() {
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
		//System.out.println("nowDate:"+nowDate);
		String[] nowDateArray = nowDate.split("-");
		int[] nowDateArrayInt = stringArrayTointArray(nowDateArray);
		
		return nowDateArrayInt;
	}

	//오늘 시간
	private int[] getNowTime() {
		SimpleDateFormat nowTimeFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		String nowTime = nowTimeFormat.format(date);
		String[] nowTimeArray = nowTime.split(":");
		//System.out.println("nowTime:"+nowTime);
		int[] nowTimeArrayInt = stringArrayTointArray(nowTimeArray);
		
		return nowTimeArrayInt;
	}
	
	private int[] stringArrayTointArray(String[] str) {
		int[] intArry = new int[str.length];
	
		for(int i=0 ; i<str.length ; i++) {
			intArry[i] = Integer.parseInt(str[i]);
		}
		
		return intArry;
	}
	
	@RequestMapping(value="/logInCheck", method=RequestMethod.GET)
	@ResponseBody
	public String logInCheck(HttpSession session) throws Exception{
		
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		//System.out.println("memberVo:"+memberVo);
		
		String result = "LogOut";
		//로그인 체크 
		if(memberVo != null) {
			result = "LogIn";
		}
		
		return result;
	}
	
	@RequestMapping(value="/userCheck", method=RequestMethod.GET)
	@ResponseBody
	public String userCheck(String seller, HttpSession session) throws Exception{
		//System.out.println("seller:"+seller);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		String result = "different";
		
		if(memberVo != null) {
			if(seller.equals(memberVo.getM_id())){
				result = "same";
			}
		}
		return result;
	}
	
	@RequestMapping(value="/logIn", method=RequestMethod.GET)
	@ResponseBody
	public String logIn(String m_id,String m_pass, HttpSession session) throws Exception{
		//System.out.println("seller:"+seller);
		
		MemberVo memberVo = auctionService.AuctionLogin(m_id, m_pass);
		
		String result = "loginFali";
		if(memberVo != null) {
			session.setAttribute("memberVo", memberVo);
			result = "loginSuccess";
		}
		
		return result;
	}
	
	//삭제 버튼을 눌렀을 때
	@RequestMapping(value="/auctionDelete", method=RequestMethod.GET)
	public String auctionDelete(int p_no) throws Exception{
		//System.out.println("seller:"+seller);
		
		//DB삭제
		auctionService.deleteAcutionAll(p_no);
		
		//local 폴더 삭제
		String folderName = Integer.toString(32);
		FurnitureFileUtil.deleteFolder(folderName);
		
		//s3 폴더 삭제 
		return "redirect:/auction/auctionSellList";
	}
	
	//이미지에서 x를 눌렀을 때 실시간으로 바로바로 이미지를 삭제한다
	//수정버튼을 눌렀을 땐 이미지에 대한 다른 처리는 안 한다
	@RequestMapping(value="/ModifyDelImg", method=RequestMethod.GET)
	@ResponseBody
	public String ModifyDelImg(String filePathName, int p_no) throws Exception{
		System.out.println("ModifyDelImg filePathName:"+filePathName+" ,p_no:"+p_no);
		
		/*한꺼번에
		DB에서 파일 삭제
		폴더에서 파일 삭제
		S3에서 파일 삭제*/
		
		//DB에서 파일 삭제
		auctionService.modifyAuction_imgDel(filePathName, p_no);		
		
		//폴더에서 파일 삭제
		FurnitureFileUtil.deleteImage(filePathName);
		
		//S3에서 파일 삭제
		AuctionFileS3Controll fs3 = new AuctionFileS3Controll(filePathName, 2);
		fs3.fileS3Controll();
				
		return "success";
	}
	
	//수정에서 이미지 드로그드롭으로 추가시
	@RequestMapping(value="/ModifyAddImg/{p_no}", method=RequestMethod.POST)
	@ResponseBody
	public String ModifyAddImg(MultipartFile file, @PathVariable("p_no") int p_no) throws Exception{
		//System.out.println("ModifyAddImg file:"+file+" ,p_no:"+p_no);

		/*한꺼번에
		DB에 파일 삽입
		폴더에서 파일 삽입
		S3에서 파일 삽입*/
		
		String filePathName = null;
		String fileName = file.getOriginalFilename();//fileName:5.jpg 파일이름과 확장자만
		//System.out.println("filePathName:"+fileName);
		boolean result = FurnitureFileUtil.checkImage(fileName);
		String returnFileResult = "false";

		if(result) {//이미지 파일인지 아닌지 먼저 체크
			
			//폴더에 파일 삽입
			filePathName = FurnitureFileUtil.uploadFile(file, String.valueOf(p_no));
			returnFileResult = filePathName;
			
			//DB에 파일 삽입
			auctionService.modifyAuction_imgInsert(filePathName, p_no);
			
			//S3에 파일 삽입
			AuctionFileS3Controll fs3 = new AuctionFileS3Controll(filePathName, 1);
			fs3.fileS3Controll();
		}
		
		return returnFileResult;		
	}
	
	@RequestMapping(value="/insertAuctionTempBid", method=RequestMethod.GET)
	public String insertAcutionTempBid(int p_no, String seller, int bidPrice, int remindMinute, HttpSession session) throws Exception{
		//System.out.println("p_no:"+p_no+" ,seller:"+seller);
		String purchaser = ((MemberVo)session.getAttribute("memberVo")).getM_id();

		//입찰한 가격 입력
		Timestamp tempDate = new Timestamp(System.currentTimeMillis());
		System.out.println("controller insertAuctionTempBid tempDate:"+ tempDate);
		AuctionTempBidVo tempBidVo = new AuctionTempBidVo(purchaser, seller, bidPrice, tempDate, p_no);
		auctionService.insertAuctionTempBid(tempBidVo);
		
		//시간 2분 추가하기
		Calendar cal = Calendar.getInstance();
		cal.set(2021,0,1); //0이면1월, 1이면 2월, ...
		int monthEnd = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		AuctionEDateVo auctionEDateVo = auctionService.getAuctionExpirationDate(p_no);
		int year = auctionEDateVo.getE_year();
		int month = auctionEDateVo.getE_month();
		int day = auctionEDateVo.getE_day();
		int hour = auctionEDateVo.getE_hour();
		int minute = auctionEDateVo.getE_minute();

		//남은시간이 5분 이하일 때 입찰하면 2분 추가
		int period = 2;
		if(remindMinute<=5) {
			if(minute+period < 60) {
				minute = minute+period;
			}else {
				if(hour+1 <= 23) {
					hour++;
					minute = (minute+period)-60;
				}else {
					if(day+1 <= monthEnd) {
						day++;
						hour = 0;//시간은 23시 다음 바로 00시가 된다
						minute = (minute+period)-60;
					}else {
						if(month+1 <= 12) {
							month++;
							day = 1;
							hour = 0;
							minute = (minute+period)-60;
						}else {
							year++;
							month = 1;
							day = 1;
							hour = 0;
							minute = (minute+period)-60;
						}
					}
				}
			}
		}
		
		//System.out.println("year:"+year+" ,month:"+month+" ,day:"+day+" ,hour:"+hour+" ,minute:"+minute);
		auctionEDateVo.setE_year(year);
		auctionEDateVo.setE_month(month);
		auctionEDateVo.setE_day(day);
		auctionEDateVo.setE_hour(hour);
		auctionEDateVo.setE_minute(minute);
		auctionService.updateAuctionEDate(auctionEDateVo);
		
		return "redirect:/auction/auctionSelected?p_no="+p_no;
	}
	
	@RequestMapping(value="/auctionModify", method=RequestMethod.GET)
	public String auctionModify(int p_no, Model model, HttpSession session) throws Exception{
		
		makeImgDirectoryAfterCheck();
		
		AuctionSellVo auctionSellVo = auctionService.getAuctionModifyList(p_no);
		model.addAttribute("auctionSellVo",auctionSellVo);
		
		List<String> imgModify = auctionService.getAuctionImgModify(p_no);
		model.addAttribute("imgModify", imgModify);
		
		/*sideBar에 count 가져온다 - 로그인 폼에 적용 해야 할 것
		String m_id = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		int sidebarCount = auctionService.getAuctionOrderDeliveryCount(m_id);
		model.addAttribute("sidebarCount", sidebarCount);
		System.out.println("controller auctionModify sidebarCount:"+sidebarCount);*/
		
		return "auction/auctionModify";
	}

	@RequestMapping(value="/auctionModifyRun", method=RequestMethod.GET)
	public String auctionModifyRun(AuctionVo auctionVo, AuctionAddressVo auctionAddressVo,
			AuctionEDateVo auctionEDateVo, AuctionMainImgVo auctionMainImgVo) throws Exception{
		
		/*이미지 파일들은 x버튼을 누르고 드래그 드롭했을 때 바로바로 삭제, 추가한다 여기선 따로 처리없고 메인 이미지 값만 업데이트한다
		 * 메인 이미지로 선택한 건 이미 로컬과 s3에 다 들어있다  메인으로 설정만 하는 것 뿐 */
		 
		/*
		System.out.println("AuctionController auctionModifyRun에서 "
				+ "auctionVo:" + auctionVo
				+ "auctionAddressVo" + auctionAddressVo
				+ "auctionEDateVo:" + auctionEDateVo
				+ "auctionMainImgVo:" + auctionMainImgVo);*/

		auctionService.modifyAuctoin(auctionVo);
		auctionService.modifyAuctionAddress(auctionAddressVo);
		auctionService.modifyAuctionMainImg(auctionMainImgVo);
		auctionService.modifyAuctionExpirationDate(auctionEDateVo);
		
		return "redirect:/auction/auctionSellList";
	}
	
	//주문서
	@RequestMapping(value="/auctionPurchaseSelected/{p_no}", method=RequestMethod.GET)
	public String auctionPurchaseSelectecd(@PathVariable("p_no") int p_no, Model model, HttpSession session) throws Exception{
		
		System.out.println("p_no:"+p_no);
		String purchaser = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		
		//상품 정보
		AuctionSoldVo auctionSoldVo = auctionService.orderAuctionSold(purchaser, p_no);
		model.addAttribute("auctionSoldVo", auctionSoldVo);
		//System.out.println("auctionController auctionPurchaseSelectecd auctionSoldVo:"+auctionSoldVo);
		//주문날짜 
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
		//System.out.println("nowDate:"+nowDate);
		model.addAttribute("nowDate", nowDate);
		
		//결제 key
		model.addAttribute("ImPortkey", ImPortkey);
		
		//구매자 이름
		MemberVo memberVo = auctionService.getMember(purchaser);
		model.addAttribute("memberVo", memberVo);
		
		/*//sideBar에 count 가져온다
		int sidebarCount = auctionService.getAuctionOrderDeliveryCount(purchaser);
		model.addAttribute("sidebarCount", sidebarCount);
		//System.out.println("controller auctionPurchaseSelectecd sidebarCount:"+sidebarCount);*/
		
		return "auction/auctionPurchaseSelected";
	}
	
	//주문서에서 결제를 눌렀을 때 실제 db에 데이터를 넣는다 
	@RequestMapping(value="/auctionPaymentCompleteShowForm", method=RequestMethod.GET)
	public String auctionPaymentCompleteShowForm(AuctionOrderVo auctionOrderVo, Model model, HttpSession session) throws Exception{
		//결제 완료 폼이 실행
		System.out.println("controller auctionPaymentCompleteShowForm auctionOrderVo:"+auctionOrderVo);
		
		//구매자 정보만 먼저 입력
		/*
		auctionOrderVo.setImp_uid("121334");
		auctionOrderVo.setMerchant_uid("78790");
		auctionOrderVo.setCard_approval_number("934949");
		auctionService.insertAuctionOrder(auctionOrderVo);
		*/
		auctionOrderVo.setImp_uid(auctionOrderVo.getImp_uid());
		auctionOrderVo.setMerchant_uid(auctionOrderVo.getMerchant_uid());
		auctionOrderVo.setCard_approval_number(auctionOrderVo.getCard_approval_number());
		auctionService.insertAuctionOrder(auctionOrderVo);
		
		//form에 구매자 정보 전달, 제품 정보 전달
		model.addAttribute("auctonOrderVo", auctionOrderVo);
		String purchaser = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		//상품 정보
		AuctionSoldVo auctionSoldVo = auctionService.orderAuctionSold(purchaser, auctionOrderVo.getP_no());
		model.addAttribute("auctionSoldVo", auctionSoldVo);
		
		//메세지 보내기 - 구매자 전화번호가 아니라 판매자 전화번호로 보내야 한다
		System.out.println("auctionOrderVo phonenumber:"+auctionOrderVo.getSeller());
		String seller = auctionOrderVo.getSeller();
		MemberVo memberVo = auctionService.getMember(seller);
		//phoneSMS(memberVo.getM_phonenumber());
		
		return "auction/auctionPaymentCompleteShowForm";
	}
	
	public void phoneSMS(String phoneNumber) throws Exception{
		//System.out.println("phoneNumber:"+phoneNumber);
	    Message sms = new Message(api_key, api_secret);
	    
	    //System.out.println("str_random:"+randomStr);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01087116886"); //무조건 자기번호 (인증)
	    params.put("type", "SMS");
	    params.put("text", "[중고 동네] 결제된 상품이 있습니다. 배송 부탁드립니다");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	    	//send() 는 메시지를 보내는 함수  
	      JSONObject obj = (JSONObject) sms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
	
	//난수 만드는 함수
	public String makeRandom(int size) { 
		StringBuffer randomBuffer = new StringBuffer();
		Random random = new Random();
		
		while(randomBuffer.length() < size) {
			randomBuffer.append(random.nextInt(9)+1);
		}
		
		return randomBuffer.toString();
	}
	
	//관심상품 눌렀을 때 로그인 정보 확인
	@RequestMapping(value="/CheckMidOfFavorite", method=RequestMethod.GET)
	@ResponseBody
	public String CheckMidofFavorite(HttpSession session) throws Exception{
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		
		if(memberVo != null) {
			String m_id = memberVo.getM_id();
			return m_id;
		}
	
		return "fail";
	}
	
	//관심상품 눌렀을 때 이미 저장 되어있는지 확인
	@RequestMapping(value="/auctionFavorite", method=RequestMethod.GET)
	@ResponseBody
	public String auctionFavorite(String m_id, int p_no, HttpSession session, Model model) throws Exception{
		//System.out.println("m_id:"+m_id+" ,p_no:"+p_no);
		
		int count = auctionService.getAuctionFavoriteCont(m_id, p_no);
		
		if(count > 0) {
			return "fail";
		}
		return "success";
	}
	
	//관심상품 눌렀을 때 저장
	@RequestMapping(value="/auctionFavoriteSave", method=RequestMethod.GET)
	@ResponseBody
	public String auctionFavoriteSave(int p_no, HttpSession session) throws Exception{
		
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		
		if(memberVo == null) {
			return "fail";
		}
	
		String m_id = memberVo.getM_id();
		//System.out.println("mid:"+m_id+" ,p_no:"+p_no);
		auctionService.insertAuctionFavorite(m_id, p_no);
		
		return "success";
	}
	
	//관심 상품 삭제 
	@RequestMapping(value="/deleteFavorite", method=RequestMethod.GET)
	public String deleteFavorite(int[] arryPno, HttpSession session) throws Exception{
		/*
		var sendData = {
				"arryPno" : arryPno
		};
		
		$.ajax({
			url : "/auction/deleteFavorite",
			dataType : "json",
			data : sendData,
			traditional : true,
			type : "get",
			success : function(data){
				alert(data);
			}
		});
		 */
		System.out.println("auctionController deleteFavorite arryPno:"+arryPno.length);
		if(arryPno.length > 0) {
			auctionService.deleteAuctionFavoriet(arryPno);
		}
		return "redirect:/cart/cartPage";
	}
	
	//상품 결제 내역
	@RequestMapping(value="/auctionPaymentList", method=RequestMethod.GET)
	public String auctionPaymentList(HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
		
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		
		String purchaser = memberVo.getM_id();
		
		List<AuctionOrderVo> payList = auctionService.getAuctionOrderPurchaserList(purchaser);
		//System.out.println("auctionPaymentList payList:"+payList);
		model.addAttribute("payList", payList);
		
		/*
		//내가 결제한 상품 내역
			//상품
		String purchaser = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		AuctionSoldVo auctionSoldVo = auctionService.orderAuctionSold(purchaser, );
		model.addAttribute("auctionSoldVo", auctionSoldVo);
			//배송지, 금액
		//AuctionOrderVo auctionOrderVo = auctionService.getauctiono
		
		//판매자의 정보에서 가져올 수 있게 내가 결제한 상품을 업데이트한다
		*/
			
		return "auction/auctionPaymentList";
	}	
	
	//배송 해야할 상품 리스트
	@RequestMapping(value="/auctionDeliveryList", method=RequestMethod.GET)
	public String auctionDeliveryList(HttpSession session, RedirectAttributes rttr, Model model) throws Exception{
		
		MemberVo memberVo =  (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			rttr.addFlashAttribute("msg", "loginFail");
			return "redirect:/auction/auctionMain";
		}
		
		String seller = memberVo.getM_id();
		
		List<AuctionOrderVo> deliveryList = auctionService.getAuctionOrderSellerList(seller);
		//System.out.println("auctionPaymentList deliveryList:"+deliveryList);
		model.addAttribute("deliveryList", deliveryList);
		
		return "auction/auctionDeliveryList";
	}
	
	@RequestMapping(value="/auctionPurchaseConfirm", method=RequestMethod.GET)
	public String auctionPurchaseConfirm(int orderId) throws Exception{
		System.out.println("orderid:"+orderId);
		
		auctionService.updateAuctionPurchaseConfirm(orderId);
		
		return "redirect:/auction/auctionPaymentList";
	}
	
	@RequestMapping(value="/deliveryInfo", method=RequestMethod.GET)
	public String deliveryInfo(AuctionOrderVo orderVo, HttpSession session) throws Exception{
		//System.out.println("orderVo"+orderVo);
		
		//여기선 DELIVERY_COMPANY, DELIVERY_NUMBER, DELIVERY_STATUS 만 바꿔준다
		auctionService.updateAuctionDeliveryConfirm(orderVo);
		
		//메세지 카운터를 바꾼다
		String seller = ((MemberVo)session.getAttribute("memberVo")).getM_id();
		int count = auctionService.getAuctionOrderDeliveryCount(seller);
		System.out.println("deliveryInfo count:"+count);
		session.setAttribute("deliveryCount", count);//session에 deliveryCount는 로그인, 로그아웃할 때, 여기서 수정
		
		
		return "redirect:/auction/auctionDeliveryList";
	}
}
