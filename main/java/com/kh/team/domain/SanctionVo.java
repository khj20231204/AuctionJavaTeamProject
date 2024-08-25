package com.kh.team.domain;

public class SanctionVo {
	private String m_id;
	private int sanc_count;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getSanc_count() {
		return sanc_count;
	}
	public void setSanc_count(int sanc_count) {
		this.sanc_count = sanc_count;
	}
	@Override
	public String toString() {
		return "SanctionVo [m_id=" + m_id + ", sanc_count=" + sanc_count + "]";
	}
	
}
