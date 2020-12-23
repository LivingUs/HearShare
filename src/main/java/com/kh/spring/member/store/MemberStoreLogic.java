package com.kh.spring.member.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.domain.Invite;
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
	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("MemberMapper.selectOne", member);
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
	public ArrayList<Member> listMember() {
		return (ArrayList)sqlSession.selectList("MemberMapper.listMember");
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("MemberMapper.updateMember", member);
	}
	
	@Override
	public int insertInvite(Invite invite) {
		return sqlSession.insert("MemberMapper.insertInvite", invite);
	}

	@Override
	public int codeCheck(Invite invite) {
		return sqlSession.selectOne("MemberMapper.codeCheck", invite);
	}

}
