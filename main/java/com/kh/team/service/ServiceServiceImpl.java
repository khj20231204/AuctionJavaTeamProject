package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.ServiceDao;
import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

@Service
public class ServiceServiceImpl implements ServiceService{
	
	@Inject
	private ServiceDao serviceDao;

	@Override
	public List<QandAVo> allQAList() throws Exception {
		List<QandAVo> allQAList = serviceDao.allQAList();
		return allQAList;
	}

	@Override
	public List<QandAVo> categoryQAList(String qa_cate_no) throws Exception {
		List<QandAVo> categoryQAList = serviceDao.categoryQAList(qa_cate_no);
		return categoryQAList;
	}

	@Override
	public List<QACateVo> QACategoryList() throws Exception {
		List<QACateVo> qaCategoryList = serviceDao.QACategoryList();
		return qaCategoryList;
	}

	@Override
	public List<QACateVo> firstQACate() throws Exception {
		List<QACateVo> firstQACategory = serviceDao.firstQACate();
		return firstQACategory;
	}

	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> noticeList = serviceDao.noticeList();
		return noticeList;
	}

	@Override
	public NoticeVo noticeDetail(int notice_no) throws Exception {
		NoticeVo noticeDetail = serviceDao.noticeDetail(notice_no);
		return noticeDetail;
	}

	@Override
	public void inquiryQ(InquiryVo inquiryVo) throws Exception {
		serviceDao.inquiryQ(inquiryVo);
	}

}
