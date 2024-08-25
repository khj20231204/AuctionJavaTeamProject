package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SanctionVo;

public interface SanctionService {
	public SanctionVo searchSanc(String m_id) throws Exception;
	public void newSanc(String m_id) throws Exception;
	public void sancUpdate(String m_id) throws Exception;
	public List<SanctionVo> sancList() throws Exception;
}
