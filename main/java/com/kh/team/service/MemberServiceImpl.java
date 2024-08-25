package com.kh.team.service;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.domain.MemberVo;


@Service
public class MemberServiceImpl implements MemberService {

	//인젝
	@Inject
	private MemberDao memberDao;

	//로그인
	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		//로그인
		MemberVo memberVo = memberDao.login(m_id, m_pass);
		return memberVo;
	}

	//아이디 찾기
	@Override
	public String sendEmailForFindId(String to) throws Exception {
		//아이디 찾기
		String m_id = memberDao.sendEmailForFindId(to);
		return m_id;
	}

	//비밀번호 찾기
	@Override
	public String sendEmailForFindPw(String to, String m_id) throws Exception {
		//비밀번호 찾기
		String m_pass = memberDao.sendEmailForFindPw(to, m_id);
		return m_pass;
	}

	//비밀번호 변경
	@Override
	public int changePw(String m_id, String m_pass_new) throws Exception {
		//비밀번호 변경
		int count = memberDao.changePw(m_id, m_pass_new);
		return count;
	}

	//개인정보 찾기
	@Override
	public MemberVo memberVoInfoSearch(String m_id) throws Exception {
		//개인정보 찾기
		MemberVo memberVo = memberDao.memberVoInfoSearch(m_id);
		return memberVo;
	}

	//개인정보 바꾸기
	@Override
	public int memberVoInfoChange(MemberVo memberVo) throws Exception {
		//개인정보 바꾸기
		int count = memberDao.memberVoInfoChange(memberVo);
		return count;
	}

	//구매하기 폼에서 개인정보 바꾸기
	@Override
	public int changeNameByCallProduct(String buyerName, String m_id, String m_pass) throws Exception {
		//구매하기 폼에서 개인정보 바꾸기
		int count = memberDao.changeNameByCallProduct(buyerName, m_id, m_pass);
		return count;
	}

	//포인트 증가
	@Override
	public int increaseMemberPoint(int totalPoint, String m_id) throws Exception {
		//해당 멤버의 포인트 가져오기
		int originalPoint = memberDao.getByMemberPoint(m_id);
		System.out.println("originalPoint:" + originalPoint);
		//포인트 증가
		int count = memberDao.increaseMemberPoint(totalPoint, m_id, originalPoint);
		return count;
	}

	//포인트 가져오기
	@Override
	public int getMemberPoint(String m_id) throws Exception {
		//포인트 가져오기
		int originalPoint = memberDao.getByMemberPoint(m_id);
		return originalPoint;
	}
	
}
