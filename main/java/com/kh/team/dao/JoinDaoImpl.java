package com.kh.team.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JoinEmailVo;
import com.kh.team.domain.MemberVo;

@Repository
public class JoinDaoImpl implements JoinDao {

	private static final String NAMESPACE="com.kh.team.join.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void joinMember(MemberVo memberVo) throws Exception {		
		sqlSession.insert(NAMESPACE+"joinMember", memberVo);
	}

	@Override
	public JoinEmailVo joinEmailConfirmSelected(JoinEmailVo vo) throws Exception {
		JoinEmailVo joinEmailVo = sqlSession.selectOne(NAMESPACE+"joinEmailConfirmSelected", vo);
		System.out.println("joinDaoImpl joinEmailVo:"+joinEmailVo);
		
		return joinEmailVo;
	}

	@Override
	public void joinEmailConfirmInsert(JoinEmailVo joinEmailVo) throws Exception {
		sqlSession.insert(NAMESPACE+"joinEmailConfirmInsert", joinEmailVo);
	}

	@Override
	public void joinEmailStatusUpdate(String email) throws Exception {
		sqlSession.update(NAMESPACE + "joinEmailStatusUpdate", email);
		
	}

}
