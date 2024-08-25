package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SanctionVo;

@Repository
public class SanctionDaoImpl implements SanctionDao {

	private static final String NAMESPACE = "com.kh.team.sanc.";
	
	@Inject
	private SqlSession SqlSession;
	
	@Override
	public SanctionVo searchSanc(String m_id) throws Exception {
		SanctionVo searchSanc = SqlSession.selectOne(NAMESPACE + "searchSanc", m_id);
		return searchSanc;
	}

	@Override
	public void newSanc(String m_id) throws Exception {
		SqlSession.insert(NAMESPACE + "newSanction", m_id);

	}

	@Override
	public void sancUpdate(String m_id) throws Exception {
		SqlSession.update(NAMESPACE + "sancUpdate", m_id);

	}

	@Override
	public List<SanctionVo> sancList() throws Exception {
		List<SanctionVo> sancList = SqlSession.selectList(NAMESPACE + "SanctionList");
		return sancList;
	}

}
