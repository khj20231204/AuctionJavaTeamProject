package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.JoinEmailVo;
import com.kh.team.domain.MemberVo;

public interface JoinDao {

	public void joinMember(MemberVo memberVo) throws Exception;
	
	public JoinEmailVo joinEmailConfirmSelected(JoinEmailVo joinEmailVo) throws Exception;
	
	public void joinEmailConfirmInsert(JoinEmailVo joinEmailVo) throws Exception;
	
	public void joinEmailStatusUpdate(String email) throws Exception;
}
