package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.SanctionDao;
import com.kh.team.domain.SanctionVo;

@Service
public class SanctionServiceImpl implements SanctionService {

	@Inject
	private SanctionDao sanctionDao;
	
	@Override
	public SanctionVo searchSanc(String m_id) throws Exception {
		SanctionVo searchSanc =	sanctionDao.searchSanc(m_id);
		return searchSanc;
	}

	@Override
	public void newSanc(String m_id) throws Exception {
		sanctionDao.newSanc(m_id);
	}

	@Override
	public void sancUpdate(String m_id) throws Exception {
		sanctionDao.sancUpdate(m_id);
	}

	@Override
	public List<SanctionVo> sancList() throws Exception {
		List<SanctionVo> sancList = sanctionDao.sancList();
		return sancList;
	}

}
