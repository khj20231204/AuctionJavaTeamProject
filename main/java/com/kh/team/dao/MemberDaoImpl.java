package com.kh.team.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.MemberVo;



@Repository
public class MemberDaoImpl implements MemberDao {

//알맞은 mapper선택하기	
private final String NAMESPACE = "com.kh.team.member.";
	
	//인젝
	@Inject
	private SqlSession sqlSession;

	//로그인 기능
	@Override
	public MemberVo login(String m_id, String m_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("m_pass", m_pass);
		//로그인 기능
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", map);
		return memberVo;
	}
	
	//이메일로 인증코드 받아서 아이디 찾기 기능
	@Override
	public String sendEmailForFindId(String to) throws Exception {
		//이메일로 인증코드 받아서 아이디 찾기 기능
		String m_id = sqlSession.selectOne(NAMESPACE + "sendEmailForFindId", to);
		return m_id;
	}
	
	//이메일로 인증코드 받아서 패스워드 찾기 기능
	@Override
	public String sendEmailForFindPw(String to, String m_id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("to", to);
		map.put("m_id", m_id);
		//이메일로 인증코드 받아서 패스워드 찾기 기능
		String m_pass = sqlSession.selectOne(NAMESPACE + "sendEmailForFindPw", map);
		return m_pass;
		
	}

	//패스워드 변환기능
	@Override
	public int changePw(String m_id, String m_pass_new) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_pass_new", m_pass_new);
		map.put("m_id", m_id);
		//패스워드 변환기능
		int count = sqlSession.update(NAMESPACE + "changePw", map);
		return count;	
		
	}

	//아이디 이용하여 접속자 정보 받아오기
	@Override
	public MemberVo memberVoInfoSearch(String m_id) throws Exception {
		//아이디 이용하여 접속자 정보 받아오기
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberVoInfoSearch", m_id);
		return memberVo;
	}

	//접속자 정보 변환
	@Override
	public int memberVoInfoChange(MemberVo memberVo) throws Exception {
		//접속자 정보 변환
		int count = sqlSession.update(NAMESPACE + "memberVoInfoChange", memberVo);
		return count;
	}

	// 구매하기 폼에서 회원정보 중 이름 바꾸기
	@Override
	public int changeNameByCallProduct(String buyerName, String m_id, String m_pass) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("m_pass", m_pass);
		map.put("m_id", m_id);
		map.put("buyerName", buyerName);
		// 구매하기 폼에서 회원정보 중 이름 바꾸기
		int count = sqlSession.update(NAMESPACE + "changeNameByCallProduct", map);
		return count;
	}

	//해당 멤버의 포인트 증가하기
	@Override
	public int increaseMemberPoint(int totalPoint, String m_id, int originalPoint) throws Exception {
		Map<String, String> map = new HashMap<>();
		String point = String.valueOf(totalPoint); 
		String pointAdd = String.valueOf(originalPoint);
		map.put("point", point);
		map.put("m_id", m_id);
		map.put("pointAdd", pointAdd);
		//해당 멤버의 포인트 증가하기
		int count = sqlSession.update(NAMESPACE + "increaseMemberPoint", map);
		return count;
	}

	//해당 멤버의 포인트 가져오기
	@Override
	public int getByMemberPoint(String m_id) throws Exception {
		//해당 멤버의 포인트 가져오기
		int originalPoint = sqlSession.selectOne(NAMESPACE + "getByMemberPoint", m_id);
		return originalPoint;
	}
	
}
