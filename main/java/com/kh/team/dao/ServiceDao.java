package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

public interface ServiceDao {
	//Q&A 전체 리스트
	public List<QandAVo> allQAList() throws Exception;
	//Q&A 카테고리 선택시 리스트
	public List<QandAVo> categoryQAList(String qa_cate_no) throws Exception;
	//Q&A 카테고리 목록(카테고리 리스트 펼쳤을 때 가져올 이름때문에 필요)
	public List<QACateVo> QACategoryList() throws Exception;
	//Q&A 대분류 카테고리(카테고리 선택때 필요)
	public List<QACateVo> firstQACate() throws Exception;
	
	//공지사항 목록
	public List<NoticeVo> noticeList() throws Exception;
	//공지사항 게시물 상세보기
	public NoticeVo noticeDetail(int notice_no) throws Exception;
	
	//1:1문의 넣기
	public void inquiryQ(InquiryVo inquiryVo) throws Exception;
}
