package com.kh.team;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionOrderVo;
import com.kh.team.domain.AuctionPnoFromTempBiding;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AuctionDaoTest {

	@Inject
	private AuctionDao auctionDao;
	
	@Test
	public void getAuctoionMainListTest() throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctoionMainList();
		System.out.println(list);
	}
	
	@Test
	public void insertAuctionImg() throws Exception{
		AuctionImgVo auctionImgVo = new AuctionImgVo();
		auctionImgVo.setImg_name("image name");
		auctionDao.insertAuctionImg(auctionImgVo);
	}
	
	@Test
	public void getAuctionBidingList() throws Exception{
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		List<AuctionSellVo> list =auctionDao.getAuctionBidingList("user03", dtVo);
		System.out.println(list);
	}
	
	@Test
	public void getAuctionBidingFinishList() throws Exception {
		int[] nDate = getNowDate();
		int[] nTime = getNowTime();
		
		AuctionDateAndTimeVo dtVo = new AuctionDateAndTimeVo(nDate[0], nDate[1], nDate[2], nTime[0], nTime[1], nTime[2]);
		
		List<AuctionSellVo> list = auctionDao.getAuctionBidingFinishList("user03", dtVo);
		System.out.println("auctioinDaoImpl BidingFinishlist:"+list);
	}
	
	//오늘 날짜
	private int[] getNowDate() {
		SimpleDateFormat nowDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowDate = nowDateFormat.format(date);
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
	
	@Test
	public void getAuctionPurchaserList() throws Exception {
		List<AuctionSoldVo> list = auctionDao.getAuctionPurchaserList("user02");
		System.out.println(list);
	}
	
	@Test
	public void modifyAuction_imgDel() throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fileAllName", "C:/Temp/auctionImg/22/2_f3694afc-5823-410b-9b2c-d614d0e84f64.jpg");
		map.put("p_no", 22);
		
		auctionDao.modifyAuction_imgDel("C:/Temp/auctionImg/22/2_f3694afc-5823-410b-9b2c-d614d0e84f64.jpg",22);
	}
	
	@Test
	public void insertAuctionOrder() throws Exception{
		AuctionOrderVo auctionOrderVo = new AuctionOrderVo();
		auctionOrderVo.setPurchase_confirm("aa");
		auctionOrderVo.setOrderer_name("orderer_name");
	}
	
	@Test
	public void getAuctionPurchaserTmepBidingPno() throws Exception{
		List<AuctionPnoFromTempBiding> p_no = auctionDao.getAuctionPurchaserTmepBidingPno("user02");
		System.out.println(p_no);
	}
	
	@Test
	public void getAuctionPurchaserTempBidingTitle() throws Exception{
		List<AuctionPnoFromTempBiding> aa = auctionDao.getAuctionPurchaserTmepBidingPno("user02");
		System.out.println(aa);
		List<AuctionVo> listvo = auctionDao.getAuctionPurchaserTempBidingTitle(aa);
		System.out.println(listvo);
	}
	
	@Test
	public void getAuctionPurchaserTempBidingImg() throws Exception{
		List<AuctionPnoFromTempBiding> aa = auctionDao.getAuctionPurchaserTmepBidingPno("user02");
		List<AuctionMainImgVo> list = auctionDao.getAuctionPurchaserTempBidingImg(aa);
		System.out.println(list);
	}
	
	@Test
	public void insertAuctionFavorite() throws Exception {
		auctionDao.insertAuctionFavorite("user03",41);
	}
	
	@Test
	public void deleteAuctionFavoriet() throws Exception{
		int[] arryPno = {24,65};
		auctionDao.deleteAuctionFavoriet(arryPno);
	}
	
	@Test
	public void getAuctionOrderPurchaserList() throws Exception{
		List<AuctionOrderVo> list = auctionDao.getAuctionOrderPurchaserList("user02");
		System.out.println("list:"+list);
	}
}
