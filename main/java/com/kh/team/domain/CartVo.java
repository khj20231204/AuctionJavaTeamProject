package com.kh.team.domain;

public class CartVo {
	private int cart_no;
	private int p_no;
	private String m_id;
	
	public int getCart_no() {
		return cart_no;
	}
	
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	
	public int getP_no() {
		return p_no;
	}
	
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
	public String getM_id() {
		return m_id;
	}
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	@Override
	public String toString() {
		return "CartVo [cart_no=" + cart_no + ", p_no=" + p_no + ", m_id=" + m_id + "]";
	}
	
}
