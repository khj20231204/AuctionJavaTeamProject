package com.kh.team.service;

import javax.inject.Inject;



import org.springframework.stereotype.Service;
import com.kh.team.dao.JoinDao;
import com.kh.team.domain.JoinEmailVo;
import com.kh.team.domain.MemberVo;

@Service
public class JoinServiceImpl implements JoinService{

	@Inject
	private JoinDao joinDao;
	
	@Override
	public void joinMember(MemberVo memberVo) throws Exception {
		joinDao.joinMember(memberVo);
	}

	@Override
	public JoinEmailVo joinEmailConfirmSelected(JoinEmailVo vo) throws Exception {
		JoinEmailVo joinEmailVo = joinDao.joinEmailConfirmSelected(vo);
		return joinEmailVo;
	}

	@Override
	public void joinEmailConfirmInsert(JoinEmailVo joinEmailVo) throws Exception {
		joinDao.joinEmailConfirmInsert(joinEmailVo);
	}

	@Override
	public void joinEmailStatusUpdate(String email) throws Exception {
		joinDao.joinEmailStatusUpdate(email);
	}

}
