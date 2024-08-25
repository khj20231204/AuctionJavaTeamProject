package com.kh.team.domain;

public class AuctionFavoriteVo {
	private int favorite_no;
	private String m_id;
	private int p_no;
	
	public int getFavorite_no() {
		return favorite_no;
	}
	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionFavoriteVo [favorite_no=" + favorite_no + ", m_id=" + m_id + ", p_no=" + p_no + "]";
	}
}
