package com.kh.team.service;

import com.kh.team.domain.JoinEmailVo;
import com.kh.team.domain.MemberVo;

public interface JoinService {

	public void joinMember(MemberVo memberVo) throws Exception;
	
	public JoinEmailVo joinEmailConfirmSelected(JoinEmailVo joinEmailVo) throws Exception;
	
	public void joinEmailConfirmInsert(JoinEmailVo joinEmailVo) throws Exception;
	
	public void joinEmailStatusUpdate(String email) throws Exception;
}
