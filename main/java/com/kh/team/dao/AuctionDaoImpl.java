package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionBidVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionFavoriteVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionOrderVo;
import com.kh.team.domain.AuctionPnoFromTempBiding;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionSDateVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;

@Repository
public class AuctionDaoImpl implements AuctionDao{

	private static final String NAMESPACE="com.kh.team.auction.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<AuctionSellVo> getAuctoionMainList() throws Exception {
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctoionMainList");
		return list;
	}
	
	@Override
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception {
		List<AuctionMainImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionMainImg");
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImg() throws Exception {
		List<AuctionImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionImg");
		return list;
	}
	
	@Override
	public int getNextSeqNumber() throws Exception {
		int currentSeq = sqlSession.selectOne(NAMESPACE + "getNextSeqNumber");
		return currentSeq;
	}

	@Override
	public void insertAuction(AuctionVo auctionVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuction", auctionVo);
	}

	@Override
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception {
		//System.out.println("DaoImpl auctionAddressVo:"+auctionAddressVo);
		sqlSession.insert(NAMESPACE+"insertAuctionAddress", auctionAddressVo);
	}

	@Override
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuctionRegisterDate", auctionRDateVo);
	}

	@Override
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception {
		//System.out.println("DaoImpl auctionEDateVo:"+auctionEDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionExpirationDate", auctionEDateVo);
	}

	@Override
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception {
		System.out.println("DaoImpl auctionSDateVo:"+auctionSDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionSoldDate", auctionSDateVo);
	}

	@Override
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuctionMainImg", auctionMainImgVo);
	}
	
	@Override
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception {
		System.out.println("DaoImpl auctionImgVo:"+auctionImgVo);
		sqlSession.insert(NAMESPACE+"insertAuctionImg", auctionImgVo);
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingList(String m_id, AuctionDateAndTimeVo dtVo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("dtVo", dtVo);
		//System.out.println("auctionDaoImpl m_id:"+m_id+" ,dtVo:"+dtVo.toString());
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctionBidingList", map);
		//System.out.println("auctioinDaoImpl Bidinglist:"+list);
		return list;
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingFinishList(String m_id, AuctionDateAndTimeVo dtVo)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("dtVo", dtVo);
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctionBidingFinishList", map);
		//System.out.println("auctioinDaoImpl BidingFinishlist:"+list);
		return list;
	}
	
	
	@Override
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception {
		List<AuctionSoldVo> list = sqlSession.selectList(NAMESPACE+"getAuctionUserMemberListSold", m_id);
		return list;
	}

	@Override
	public AuctionSellVo getAuctionSelectedItem(int p_no) throws Exception {
		AuctionSellVo list = sqlSession.selectOne(NAMESPACE+"getAuctionSelectedItem", p_no);
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionSelectedImg(int p_no) throws Exception {
		List<AuctionImgVo> list = sqlSession.selectList(NAMESPACE+"getAuctionSelectedImg", p_no);
		return list;
	}

	@Override
	public MemberVo AuctionLogin(String m_id, String m_pass) throws Exception {

		Map<String, String> member = new HashMap<>();
		member.put("m_id", m_id);
		member.put("m_pass", m_pass);
		
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "AuctionLogin", member);
		
		return memberVo;
	}

	@Override
	public void deleteAuction_temp_bid(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_temp_bid", p_no);
	}

	@Override
	public void deleteAuction_bid(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_bid", p_no);
	}

	@Override
	public void deleteAuction_address(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_address", p_no);
	}

	@Override
	public void deleteAuction_expration_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_expration_date", p_no);
	}

	@Override
	public void deleteAuction_img(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_img", p_no);
	}

	@Override
	public void deleteAuction_main_img(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_main_img", p_no);
	}

	@Override
	public void deleteAuction_register_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_register_date", p_no);
	}

	@Override
	public void deleteAuction_sold_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_sold_date", p_no);
	}

	@Override
	public void deleteAuction(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction", p_no);
	}

	@Override
	public List<AuctionTempBidVo> getAuctionTempBid(int p_no) throws Exception {
		List<AuctionTempBidVo> auctionTempBidVo = sqlSession.selectList(NAMESPACE + "getAuctionTempBid", p_no);
		return auctionTempBidVo;
	}

	@Override
	public AuctionBidVo getAuctionBid(int p_no) throws Exception {
		AuctionBidVo auctionBidVo = sqlSession.selectOne(NAMESPACE + "getAuctionBid", p_no);
		return auctionBidVo;
	}

	@Override 
	public int getAuctionTempBidMaxPrice(int p_no) throws Exception {
		String tempBidMaxPrice = sqlSession.selectOne(NAMESPACE + "getAuctoinTempBidMaxPrice", p_no);
		
		int max=0;
		if(tempBidMaxPrice != null) {
			max = Integer.parseInt(tempBidMaxPrice);
		}
			
		return max;
	}

	@Override
	public int getAuctionCountBid(int p_no) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "getAuctionCountBid", p_no);
		return count;
	}

	@Override
	public void insertAuctionTempBid(AuctionTempBidVo tempBidVo) throws Exception {
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("purchaser", purchaser);
		map.put("seller", seller);
		map.put("bidPrice", bidPrice);
		map.put("p_no", p_no);
		*/
		
		sqlSession.insert(NAMESPACE + "insertAuctionTempBid", tempBidVo);
	}

	@Override
	public AuctionEDateVo getAuctionExpirationDate(int p_no) throws Exception {
		AuctionEDateVo auctionEDateVo = sqlSession.selectOne(NAMESPACE + "getAuctionExpirationDate", p_no);
		return auctionEDateVo;
	}

	@Override
	public void updateAuctionEDate(AuctionEDateVo auctionEDateVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionEDate", auctionEDateVo);
		
	}

	@Override
	public AuctionTempBidVo getTempBidFromMaxPrice(int p_no) throws Exception {
		AuctionTempBidVo auctionTempBidVo = sqlSession.selectOne(NAMESPACE + "getTempBidFromMaxPrice", p_no);
		return auctionTempBidVo;
	}

	@Override
	public void insertAutoCommitBid(int p_no) throws Exception {
		sqlSession.insert(NAMESPACE + "insertAutoCommitBid", p_no); 
	}

	@Override
	public void updateAuctionAfterFinish(String purchaser, int sold_price, int p_no, String seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("purchaser", purchaser);
		map.put("sold_price", sold_price);
		map.put("p_no", p_no);
		map.put("seller", seller);
		sqlSession.update(NAMESPACE + "updateAuctionAfterFinish", map);
	}

	@Override
	public List<AuctionSoldVo> getAuctionPurchaserList(String m_id) throws Exception {
		List<AuctionSoldVo> list = sqlSession.selectList(NAMESPACE + "getAuctionPurchaserList", m_id);
		return list;
	}

	@Override
	public void updateAuctionExpriationDeadline(int p_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionExpriationDeadline", p_no);
	}

	@Override
	public AuctionSellVo getAuctionModifyList(int p_no) throws Exception {
		AuctionSellVo auctionSellVo = sqlSession.selectOne(NAMESPACE + "getAuctionModifyList", p_no);
		return auctionSellVo;
	}

	@Override
	public List<String> getAuctionImgModify(int p_no) throws Exception {
		List<String> imgModify = sqlSession.selectList(NAMESPACE + "getAuctionImgModify", p_no);
		return imgModify;
	}

	@Override
	public void modifyAuction_imgDel(String fileAllName, int p_no) throws Exception {
		System.out.println("AuctionDaoImpl modifyAuction_imgDel:"+fileAllName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("fileAllName", fileAllName);
		map.put("p_no", p_no);
		
		sqlSession.delete(NAMESPACE + "modifyAuction_imgDel", map);
	}

	@Override
	public void modifyAuction_imgInsert(String fileAllName, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fileAllName", fileAllName);
		map.put("p_no", p_no);
		
		sqlSession.insert(NAMESPACE + "modifyAuction_imgInsert", map);
	}

	@Override
	public void modifyAuctoin(AuctionVo auctionVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyAuctoin", auctionVo);
	}

	@Override
	public void modifyAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyAuctionAddress", auctionAddressVo);
	}

	@Override
	public void modifyAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyAuctionMainImg", auctionMainImgVo);
		
	}

	@Override
	public void modifyAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyAuctionExpirationDate", auctionEDateVo);
	}

	@Override
	public AuctionSoldVo orderAuctionSold(String purchaser, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("purchaser", purchaser);
		map.put("p_no", p_no);
		
		AuctionSoldVo auctionSoldVo = sqlSession.selectOne(NAMESPACE + "orderAuctionSold", map);
		
		return auctionSoldVo;
	}

	@Override
	public MemberVo getMember(String m_id) throws Exception {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMember", m_id);
		return memberVo;
	}

	@Override
	public void insertAuctionOrder(AuctionOrderVo auctionOrderVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertAuctionOrder", auctionOrderVo);
	}

	@Override
	public List<AuctionOrderVo> getAuctionOrderPurchaserList(String purchaser) throws Exception {
		List<AuctionOrderVo> list = sqlSession.selectList(NAMESPACE + "getAuctionOrderPurchaserList", purchaser);
		return list;
	}

	@Override
	public int getAuctionOrderDeliveryCount(String seller) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "getAuctionOrderDeliveryCount", seller);
		return count;
	}

	@Override
	public void updateAuctionOrderDeliveryFormation(String delivery_company, String delivery_number) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("delivery_company", delivery_company);
		map.put("delivery_number", delivery_number);
		
		sqlSession.update(NAMESPACE + "updateAuctionOrderDeliveryFormation", map);
	}

	@Override
	public List<AuctionOrderVo> getAuctionOrderSellerList(String seller) throws Exception {
		List<AuctionOrderVo> list = sqlSession.selectList(NAMESPACE + "getAuctionOrderSellerList", seller);
		return list;
	}

	@Override
	public List<AuctionTempBidVo> getAuctionPurchaserTempBiding(String m_id) throws Exception {
		List<AuctionTempBidVo> list = sqlSession.selectList(NAMESPACE + "getAuctionPurchaserTempBiding", m_id);
		return list;
	}

	@Override
	public List<AuctionPnoFromTempBiding> getAuctionPurchaserTmepBidingPno(String m_id) throws Exception {
		List<AuctionPnoFromTempBiding> p_no = sqlSession.selectList(NAMESPACE + "getAuctionPurchaserTmepBidingPno", m_id);
		//List<AuctionVo> listTitle = sqlSession.selectList(NAMESPACE + "getAuctionPurchaserTempBidingTitle", p_noArray);
		return p_no;
	}

	@Override
	public List<AuctionVo> getAuctionPurchaserTempBidingTitle(List<AuctionPnoFromTempBiding> tempPno)
			throws Exception {
		List<AuctionVo> list = sqlSession.selectList(NAMESPACE+"getAuctionPurchaserTempBidingTitle", tempPno);
		return list;
	}

	@Override
	public List<AuctionMainImgVo> getAuctionPurchaserTempBidingImg(List<AuctionPnoFromTempBiding> tempPno)
			throws Exception {
		List<AuctionMainImgVo> list = sqlSession.selectList(NAMESPACE+"getAuctionPurchaserTempBidingImg", tempPno);
		return list;
	}

	@Override
	public int getAuctionFavoriteCont(String m_id, int p_no) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("p_no", p_no);
		
		int count = sqlSession.selectOne(NAMESPACE + "getAuctionFavoriteCont", map);
		
		return count;
	}

	@Override
	public void insertAuctionFavorite(String m_id, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("p_no", p_no);
		
		sqlSession.insert(NAMESPACE + "insertAuctionFavorite", map);
	}
	
	@Override
	public List<AuctionPnoFromTempBiding> getAuctionFavoritePno(String m_id) throws Exception {
		List<AuctionPnoFromTempBiding> list = sqlSession.selectList(NAMESPACE + "getAcutionFavoritePno", m_id);
		System.out.println("auctionDaoImpl getAuctionFavoritePno list:"+list);
		return list;
	}
	
	@Override
	public List<AuctionSellVo> getAuctionFavoriteList(List<AuctionPnoFromTempBiding> pnolist) throws Exception {
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE + "getAuctionFavoriteList", pnolist);
		return list;
	}

	@Override
	public void deleteAuctionFavoriet(int[] array) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteAuctionFavoriet", array);
	}

	@Override
	public void updateAuctionPurchaseConfirm(int order_id) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionPurchaseConfirm", order_id);
		
	}

	@Override
	public void updateAuctionDeliveryConfirm(AuctionOrderVo orderVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionDeliveryConfirm", orderVo);
	}
}
