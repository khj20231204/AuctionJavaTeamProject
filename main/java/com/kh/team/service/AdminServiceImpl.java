package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.AdminDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDao adminDao;
	
	
	//회원 삭제 페이지에 필요한 회원 목록
	@Override
	public List<MemberVo> adminMemberSearch() throws Exception {
		List<MemberVo> memberList = adminDao.adminMemberSearch();
		return memberList;
	}

	//회원 삭제
	@Override
	public void adminMemberDelete(String m_id) throws Exception {
		adminDao.adminMemberClothesDelete(m_id);
		adminDao.adminMemberComputerDelete(m_id);
		adminDao.adminMemberWhitegoodsDelete(m_id);
		adminDao.adminMemberFBedDelete(m_id);
		adminDao.adminMemberFInteriorDelete(m_id);
		adminDao.adminMemberFKitchenDelete(m_id);
		adminDao.adminMemberFLifeDelete(m_id);
		adminDao.adminMemberProductDelete(m_id);
		adminDao.adminCartDelete(m_id);
		adminDao.adminSanctionDelete(m_id);
		adminDao.adminMemberInquiryDelete(m_id);
		adminDao.adminMemberDelete(m_id);
	}	
	
	
	//게시물 삭제 페이지 들어갔을 때 모든 게시물 보기
	@Override
	public List<ProductVo> allProductList() throws Exception {
		List<ProductVo> allProductList = adminDao.allProductList();
		return allProductList;
	}

	//의류 게시물 삭제
	@Override
	public void adminClothesDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminClothesDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}

	//컴퓨터 게시물 삭제
	@Override
	public void adminComputerDelete(int p_no, int p_no2) throws Exception {
		ComputerVo com = adminDao.computerNoGet(p_no2);
		int c_no = com.getC_com_no();
		adminDao.adminComPercentDelete(c_no);
		adminDao.productImgDelete(p_no2);
		adminDao.adminComputerDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}
	
	//가전제품 게시물 삭제
	@Override
	public void adminWhitegoodsDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminWhitegoodsDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}

	//침구류 게시물 삭제
	@Override
	public void adminFBedDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminFBedDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}

	//인테리어 게시물 삭제
	@Override
	public void adminFInteriorDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminFInteriorDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}

	//주방용품 게시물 삭제
	@Override
	public void adminFKitchenDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminFKitchenDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}

	//생활용품 게시물 삭제
	@Override
	public void adminFLifeDelete(int p_no, int p_no2) throws Exception {
		adminDao.productImgDelete(p_no2);
		adminDao.adminFLifeDelete(p_no);
		adminDao.adminProductDelete(p_no2);
	}
	

	//카테고리 추가
	@Override
	public void adminCategoryInput(CategoryVo categoryVo) throws Exception {
		adminDao.adminCategoryInput(categoryVo);
	}

	//카테고리 삭제
	@Override
	public void adminCategoryDelete(String cate_no) throws Exception {
		adminDao.adminCateDeleteClothes(cate_no);
		adminDao.adminCateDeleteComputer(cate_no);
		adminDao.adminCateDeleteWhitegoods(cate_no);
		adminDao.adminCateDeleteFBed(cate_no);
		adminDao.adminCateDeleteFInterior(cate_no);
		adminDao.adminCateDeleteFKitchen(cate_no);
		adminDao.adminCateDeleteFLife(cate_no);
		adminDao.adminCateDeleteProduct(cate_no);
		adminDao.adminCategoryDelete(cate_no);
	}

	//모든 카테고리 목록 가져오기
	@Override
	public List<CategoryVo> getCategoryList() throws Exception {
		List<CategoryVo> getCategoryList = adminDao.getCategoryList();
		return getCategoryList;
	}

	//카테고리 별 상품 목록 가져오기
	@Override
	public List<ProductVo> productCateList(String cate_no) throws Exception {
		List<ProductVo> productCateList = adminDao.productCateList(cate_no);
		return productCateList;
	}

	//카테고리 삭제 페이지에서 선택한 카테고리 하위분류 가져오기
	@Override
	public List<CategoryVo> categoryDeleteList(String cate_no) throws Exception {
		List<CategoryVo> categoryDeleteList = adminDao.categoryDeleteList(cate_no);
		return categoryDeleteList;
	}
	
	//판매자 등록 취소
	@Override
	public void rollbackSeller(String m_id) throws Exception {
		adminDao.rollbackSeller(m_id);
	}
	
	//판매자 리스트
	@Override
	public List<MemberVo> sellerList() throws Exception {
		List<MemberVo> sellerList = adminDao.sellerList();
		return sellerList;
	}

	//카테고리 추가에 필요한 대분류 가져오기
	@Override
	public List<CategoryVo> firstCategoryList() throws Exception {
		List<CategoryVo> firstCategoryList = adminDao.firstCategoryList();
		return firstCategoryList;
	}

	//카테고리 추가에 필요한 하위분류 가져오기
	@Override
	public List<CategoryVo> otherCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> otherCategoryList = adminDao.otherCategoryList(cate_ref);
		return otherCategoryList;
	}

	//관리자 게시물 삭제 시 S3에 있는 이미지를 지우기 위한 이미지 이름 가져오기
	@Override
	public String imgNameSearch(int p_no2) throws Exception {
		String imgNameSearch = adminDao.imgNameSearch(p_no2);
		return imgNameSearch;
	}

	//게시물 삭제시 S3에 있는 이미지 지우기 위한 이름 목록
	@Override
	public String[] productImgList(int p_no) throws Exception {
		String[] productImgList = adminDao.getFileName(p_no);
		return productImgList;
	}

	//Q&A 수정/삭제에 필요한 Q&A리스트 가져오기
	@Override
	public List<QandAVo> QA_UDList() throws Exception {
		List<QandAVo> QA_UDList = adminDao.QA_UDList();
		return QA_UDList;
	}

	//Q&A 수정/삭제 페이지에서 카테고리 이름을 뜨게하기 위해 카테고리 리스트 가져오기
	@Override
	public List<QACateVo> QACategory() throws Exception {
		List<QACateVo> QACategory = adminDao.QACategory();
		return QACategory;
	}
	
	//Q&A 추가에 사용될 카테고리 대분류 가져오기
	@Override
	public List<QACateVo> firstQACategory() throws Exception {
		List<QACateVo> firstQACategory = adminDao.firstQACategory();
		return firstQACategory;
	}

	//Q&A 추가에 사용될 카테고리 하위분류 가져오기
	@Override
	public List<QACateVo> otherQACategory(String qa_cate_no) throws Exception {
		List<QACateVo> otherQACategory = adminDao.otherQACategory(qa_cate_no);
		return otherQACategory;
	}

	//Q&A 추가하기
	@Override
	public void qaInsert(QandAVo qandAVo) throws Exception {
		adminDao.qaInsert(qandAVo);
	}

	//Q&A 삭제하기
	@Override
	public void QADelete(int qa_no) throws Exception {
		adminDao.QADelete(qa_no);
	}
	//수정하기에 사용할 상세보기 데이터
	@Override
	public QandAVo QandADetail(int qa_no) throws Exception {
		QandAVo qandaDetail = adminDao.QandADetail(qa_no);
		return qandaDetail;
	}
	//Q&A 수정하기
	@Override
	public void QAUpdate(QandAVo qandAVo) throws Exception {
		adminDao.QAUpdate(qandAVo);
	}

	//Q&A 카테고리 추가하기
	@Override
	public void qaCategoryInsert(QACateVo qaCateVo) throws Exception {
		adminDao.qaCategoryInsert(qaCateVo);
	}

	//Q&A 카테고리 삭제하기
	@Override
	public void qaCategoryDelete(String qa_cate_no) throws Exception {
		adminDao.qaCategoryQADelete(qa_cate_no);
		adminDao.qaCategoryDelete(qa_cate_no);
	}
	
	//공지사항 리스트 가져오기
	@Override
	public List<InquiryVo> inquiryList() throws Exception {
		List<InquiryVo> inquiryList = adminDao.inquiryList();
		return inquiryList;
	}

	//공지사항 상세보기
	@Override
	public InquiryVo detailInquiry(int inquiry_no) throws Exception {
		InquiryVo detailInquiry = adminDao.detailInquiry(inquiry_no);
		return detailInquiry;
	}

	//1:1문의 삭제
	@Override
	public void deleteInquiry(int inquiry_no) throws Exception {
		adminDao.deleteInquiry(inquiry_no);
	}

	//공지사항 추가
	@Override
	public void insertNotice(NoticeVo noticeVo) throws Exception {
		adminDao.insertNotice(noticeVo);
	}

	//공지사항 삭제
	@Override
	public void noticeDelete(int notice_no) throws Exception {
		adminDao.noticeDelete(notice_no);
	}
	
}
