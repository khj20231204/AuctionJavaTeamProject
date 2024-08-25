package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.InquiryVo;
import com.kh.team.domain.NoticeVo;
import com.kh.team.domain.QACateVo;
import com.kh.team.domain.QandAVo;

@Repository
public class ServiceDaoImpl implements ServiceDao{
	
	private static final String NAMESPACE = "com.kh.team.service.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<QandAVo> allQAList() throws Exception {
		List<QandAVo> allQAList = sqlSession.selectList(NAMESPACE + "allQAList");
		return allQAList;
	}

	@Override
	public List<QandAVo> categoryQAList(String qa_cate_no) throws Exception {
		List<QandAVo> categoryQAList = sqlSession.selectList(NAMESPACE + "categoryQAList", qa_cate_no);
		return categoryQAList;
	}

	@Override
	public List<QACateVo> QACategoryList() throws Exception {
		List<QACateVo> qaCategoryList = sqlSession.selectList(NAMESPACE + "qaCategoryList");
		return qaCategoryList;
	}

	@Override
	public List<QACateVo> firstQACate() throws Exception {
		 List<QACateVo> firstQACategory = sqlSession.selectList(NAMESPACE + "firstQACategory");
		return firstQACategory;
	}

	@Override
	public List<NoticeVo> noticeList() throws Exception {
		List<NoticeVo> noticeList = sqlSession.selectList(NAMESPACE + "noticeList");
		return noticeList;
	}

	@Override
	public NoticeVo noticeDetail(int notice_no) throws Exception {
		NoticeVo noticeDetail = sqlSession.selectOne(NAMESPACE + "noticeDetail", notice_no);
		return noticeDetail;
	}

	@Override
	public void inquiryQ(InquiryVo inquiryVo) throws Exception {
		sqlSession.insert(NAMESPACE + "inquiryQ", inquiryVo);
	}

}
