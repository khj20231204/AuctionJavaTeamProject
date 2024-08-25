package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.MessageVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WhitegoodsVo;

public interface SellProductService {
	//하위 카테고리 가져오기
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception;
	//판매자 등록
	public void sellerReg(String m_id) throws Exception;
	//카테고리 대분류 가져오기
	public List<CategoryVo> firstCategoryList() throws Exception;
	
	//상품 등록
	public void whitegoodsInsert(WhitegoodsVo whitegoodsVo, ProductImgVo productImgeVo) throws Exception; 
	public void computerInsert(ComputerVo computerVo, ProductImgVo productImgVo) throws Exception;
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception;
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception;
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception;
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo, ProductImgVo productImgVo) throws Exception;
	public void insertProduct(ProductVo productVo) throws Exception;
	//상품등록 시 이미지 등록
//	public void productImage(ProductImgVo productImgVo) throws Exception;
	
	// 판매자에게 메시지 보내기
	public void seller_TO_message(MessageVo messageVo) throws Exception;
	
	// 받은 메시지 목록 
	public List<MessageVo> receive_MessageList(String m_id) throws Exception;
	
	// 보낸 메시지 목록
	public List<MessageVo> send_MessageList(String m_id) throws Exception;
	
	// 메시지내용
	public MessageVo messageContent(int msg_no) throws Exception;
	
}
