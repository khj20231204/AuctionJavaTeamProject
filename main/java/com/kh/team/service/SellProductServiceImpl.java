package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.SellProductDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.MessageVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WhitegoodsVo;

@Service
public class SellProductServiceImpl implements SellProductService {

	@Inject
	private SellProductDao sellProductDao;
	
	//카테고리 셀렉트박스에 카테고리 띄우기
	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = sellProductDao.getCategoryList(cate_ref);
		return getCategoryList;
	}

	//판매자 등록
	@Override
	public void sellerReg(String m_id) throws Exception {
		sellProductDao.sellerReg(m_id);
	}

	//컴퓨터 등록
	@Override
	public void computerInsert(ComputerVo computerVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		computerVo.setP_no(p_no);
		sellProductDao.computerInsert(computerVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
		
	}

	@Override
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		furnitureInteriorVo.setP_no(p_no);
		sellProductDao.fBedInsert(furnitureInteriorVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
	}

	@Override
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		furnitureInteriorVo.setP_no(p_no);
		sellProductDao.fInteriorInsert(furnitureInteriorVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
	}

	@Override
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		furnitureInteriorVo.setP_no(p_no);
		sellProductDao.fKitchenInsert(furnitureInteriorVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
	}

	@Override
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		furnitureInteriorVo.setP_no(p_no);
		sellProductDao.fLifeInsert(furnitureInteriorVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
	}
	
	@Override
	public void insertProduct(ProductVo productVo) throws Exception {
		sellProductDao.insertProduct(productVo);
	}

	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = sellProductDao.firstCategoryList();
		return firstCategoryList;
	}

	//가전제품 등록
	@Override
	public void whitegoodsInsert(WhitegoodsVo whitegoodsVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = sellProductDao.getPnoNextval();
		whitegoodsVo.setP_no(p_no);
		sellProductDao.whitegoodsInsert(whitegoodsVo);
		productImgVo.setP_no(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				sellProductDao.productImage(img_name, p_no);
			}
		}
	}

	// 판매자에게 메시지 보내기
	@Override
	public void seller_TO_message(MessageVo messageVo) throws Exception {
		sellProductDao.seller_TO_message(messageVo);
	}

	// 받은 메시지함
	@Override
	public List<MessageVo> receive_MessageList(String m_id) throws Exception {
		List<MessageVo> list = sellProductDao.receive_MessageList(m_id);
		return list;
	}

	// 보낸 메시지함
	@Override
	public List<MessageVo> send_MessageList(String m_id) throws Exception {
		List<MessageVo> list = sellProductDao.send_MessageList(m_id);
		return list;
	}

	// 메시지 컨텐츠
	@Override
	public MessageVo messageContent(int msg_no) throws Exception {
		MessageVo messageVo = sellProductDao.messageContent(msg_no);
		return messageVo;
	}

}
