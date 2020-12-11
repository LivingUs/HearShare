package com.kh.spring.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.domain.Member;

@Repository
public class MemberStoreLogic implements MemberStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int joinMember(Member member) {
		return sqlSession.insert("MemberMapper.joinMember", member);
	}

	@Override
	public int idRecheck(String memberId) {
		return sqlSession.selectOne("MemberMapper.checkIdDup", memberId);
	}

	@Override
	public Member loginMember(Member member) {
		return sqlSession.selectOne("MemberMapper.loginMember", member);
	}

	@Override
	public int updateMember(Member member) {
		return 0;
	}

	@Override
	public int deleteMember(String memberId) {
		return 0;
	}

}
