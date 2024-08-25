package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.FurnitureInteriorVo;
import com.kh.team.domain.MessageVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WhitegoodsVo;

@Repository
public class SellProductDaoImpl implements SellProductDao {

	private static final String NAMESPACE = "com.kh.team.sell.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = sqlSession.selectList(NAMESPACE + "getCategoryList", cate_ref);
		return getCategoryList;
	}

	@Override
	public void sellerReg(String m_id) throws Exception {
		sqlSession.update(NAMESPACE + "registration", m_id);
	}

	

	@Override
	public void computerInsert(ComputerVo computerVo) throws Exception {
		sqlSession.insert(NAMESPACE + "computerInsert", computerVo);
		
	}

	@Override
	public void fBedInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fBedInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fInteriorInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fInteriorInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fKitchenInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fKitchenInsert", furnitureInteriorVo);
		
	}

	@Override
	public void fLifeInsert(FurnitureInteriorVo furnitureInteriorVo) throws Exception {
		sqlSession.insert(NAMESPACE + "fLifeInsert", furnitureInteriorVo);
		
	}

	@Override
	public void insertProduct(ProductVo productVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertProduct", productVo);
	}
	
	@Override
	public void productImage(String img_name, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("img_name", img_name);
		map.put("p_no", p_no);
		sqlSession.insert(NAMESPACE + "productImage", map);
	}

	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = sqlSession.selectList(NAMESPACE + "firstCategoryList");
		return firstCategoryList;
	}

	@Override
	public int getPnoNextval() {
		int p_no = sqlSession.selectOne(NAMESPACE + "getPnoNextVal");
		return p_no;
	}

	@Override
	public String[] getFileNames(int p_no) {
		List<String> filenames = sqlSession.selectList(NAMESPACE + "getFileNames", p_no);
		String arr[] = new String[filenames.size()];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = filenames.get(i);
		}
		return arr;
	}

	@Override
	public void whitegoodsInsert(WhitegoodsVo whitegoodsVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertWhitegoods", whitegoodsVo);
	}

	// 판매자에게 메시지 보내기
	@Override
	public void seller_TO_message(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + "seller_TO_message" , messageVo);
	}

	// 받은 메시지함
	@Override
	public List<MessageVo> receive_MessageList(String m_id) throws Exception {
		List<MessageVo> list = sqlSession.selectList(NAMESPACE + "receive_MessageList" , m_id);
		return list;
	}

	// 보낸 메시지함
	@Override
	public List<MessageVo> send_MessageList(String m_id) throws Exception {
		List<MessageVo> list = sqlSession.selectList(NAMESPACE + "send_MessageList" , m_id);
		return list;
	}

	// 메시지 컨텐츠
	@Override
	public MessageVo messageContent(int msg_no) throws Exception {
		MessageVo messageVo = sqlSession.selectOne(NAMESPACE + "messageContent" , msg_no);
		return messageVo;
	}
	
	

}
